/*
 * Benchmark the public KEM entry points and the two PQQS26 wrappers.
 *
 * The duration is the total for all rounds in an epoch. Keeping the timer
 * implementation here makes the CSV useful on machines with a cycle counter.
 */
#include <errno.h>
#include <inttypes.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#if defined(__APPLE__)
#include <mach/mach_time.h>
#elif defined(__unix__) || defined(__unix)
#include <time.h>
#endif

#include "pqcrystals-kyber/ref/kem.h"
#include "pqcrystals-kyber/ref/params.h"
#include "pqqs26/pqqs26.h"

#define DEFAULT_EPOCHS 10U
#define DEFAULT_ROUNDS 100U

static volatile unsigned int benchmark_sink;

#if defined(__x86_64__)
static const char *const timer_unit = "RDTSCP";

static inline uint64_t timer_read(void) {
    uint32_t low, high;

    /* LFENCE orders loads and the counter read. The trailing LFENCE orders
     * later loads and the memory clobber constrains the compiler. */
    __asm__ volatile("lfence\n\trdtscp\n\tlfence"
                     : "=a"(low), "=d"(high)
                     : "c"(0)
                     : "memory");
    return ((uint64_t)high << 32) | low;
}
#define TIMER_NEEDS_FALLBACK 0
#elif defined(__APPLE__)
static const char *const timer_unit = "mach/time";

static inline uint64_t timer_read(void) { return mach_absolute_time(); }
#define TIMER_NEEDS_FALLBACK 0
#elif defined(__aarch64__)
static const char *const timer_unit = "CNTVCT_EL0";

static inline uint64_t timer_read(void) {
    uint64_t value;

    __asm__ volatile("isb\n\tmrs %0, cntvct_el0\n\tisb"
                     : "=r"(value)::"memory");
    return value;
}
#define TIMER_NEEDS_FALLBACK 0
#else
#define TIMER_NEEDS_FALLBACK 1
#endif

#if TIMER_NEEDS_FALLBACK
static const char *const timer_unit = "clock_gettime";

static inline uint64_t timer_read(void) {
    struct timespec ts;
#if defined(CLOCK_MONOTONIC_RAW)
    const clockid_t clock_id = CLOCK_MONOTONIC_RAW;
#else
    const clockid_t clock_id = CLOCK_MONOTONIC;
#endif
    if (clock_gettime(clock_id, &ts) != 0) {
        perror("clock_gettime");
        exit(EXIT_FAILURE);
    }
    return (uint64_t)ts.tv_sec * UINT64_C(1000000000) + (uint64_t)ts.tv_nsec;
}
#endif

typedef int (*benchmark_fn)(void *);

struct benchmark_data {
    uint8_t *pk;
    uint8_t *sk;
    uint8_t *kyber_ct;
    uint8_t *etm_ct;
    uint8_t *tch_ct;
    uint8_t *ss;
};

static int run_keypair(void *arg) {
    struct benchmark_data *data = arg;
    int rc = crypto_kem_keypair(data->pk, data->sk);
    benchmark_sink ^= (unsigned int)rc;
    return rc;
}

static int run_kyber_enc(void *arg) {
    struct benchmark_data *data = arg;
    int rc =
        PQQS26_KYBER_crypto_kem_enc(data->kyber_ct, data->ss, data->pk);
    benchmark_sink ^= (unsigned int)rc;
    return rc;
}

static int run_kyber_dec(void *arg) {
    struct benchmark_data *data = arg;
    int rc =
        PQQS26_KYBER_crypto_kem_dec(data->ss, data->kyber_ct, data->sk);
    benchmark_sink ^= (unsigned int)rc;
    return rc;
}

static int run_etm_enc(void *arg) {
    struct benchmark_data *data = arg;
    int rc = PQQS26_ETM_crypto_kem_enc(data->etm_ct, data->ss, data->pk);
    benchmark_sink ^= (unsigned int)rc;
    return rc;
}

static int run_etm_dec(void *arg) {
    struct benchmark_data *data = arg;
    int rc = PQQS26_ETM_crypto_kem_dec(data->ss, data->etm_ct, data->sk);
    benchmark_sink ^= (unsigned int)rc;
    return rc;
}

static int run_tch_enc(void *arg) {
    struct benchmark_data *data = arg;
    int rc = PQQS26_TCH_crypto_kem_enc(data->tch_ct, data->ss, data->pk);
    benchmark_sink ^= (unsigned int)rc;
    return rc;
}

static int run_tch_dec(void *arg) {
    struct benchmark_data *data = arg;
    int rc = PQQS26_TCH_crypto_kem_dec(data->ss, data->tch_ct, data->sk);
    benchmark_sink ^= (unsigned int)rc;
    return rc;
}

static void benchmark(const char *name, benchmark_fn function,
                      struct benchmark_data *data, unsigned int epoch,
                      unsigned int rounds) {
    unsigned int i;
    uint64_t start, end;

    start = timer_read();
    for (i = 0; i < rounds; ++i)
        (void)function(data);
    end = timer_read();

    printf("%s,%u,%u,%" PRIu64 ",%s\n", name, epoch, rounds,
           end - start, timer_unit);
}

static unsigned int argument_or_default(int argc, char **argv, int index,
                                        unsigned int default_value) {
    char *end;
    unsigned long value;

    if (argc <= index)
        return default_value;
    errno = 0;
    value = strtoul(argv[index], &end, 10);
    if (errno != 0 || *argv[index] == '\0' || *end != '\0' || value == 0 ||
        value > UINT_MAX) {
        fprintf(stderr, "invalid positive integer: %s\n", argv[index]);
        exit(EXIT_FAILURE);
    }
    return (unsigned int)value;
}

int main(int argc, char **argv) {
    const unsigned int epochs =
        argument_or_default(argc, argv, 1, DEFAULT_EPOCHS);
    const unsigned int rounds =
        argument_or_default(argc, argv, 2, DEFAULT_ROUNDS);
    uint8_t pk[KYBER_PUBLICKEYBYTES], sk[KYBER_SECRETKEYBYTES];
    uint8_t kyber_ct[KYBER_CIPHERTEXTBYTES];
    uint8_t etm_ct[ETM_CIPHERTEXTBYTES];
    uint8_t tch_ct[TCH_CIPHERTEXTBYTES];
    uint8_t ss[KYBER_SSBYTES];
    struct benchmark_data data = {pk, sk, kyber_ct, etm_ct, tch_ct, ss};
    unsigned int epoch;

    printf("routine,epoch,rounds,duration,unit\n");
    for (epoch = 0; epoch < epochs; ++epoch) {
        /* The keypair and each encapsulation precede its matching decapsulation
         * below, so every operation receives correctly sized inputs. */
        benchmark("kyber/keypair", run_keypair, &data, epoch, rounds);
        benchmark("kyber/enc", run_kyber_enc, &data, epoch, rounds);
        benchmark("kyber/dec", run_kyber_dec, &data, epoch, rounds);
        benchmark("etm/enc", run_etm_enc, &data, epoch, rounds);
        benchmark("etm/dec", run_etm_dec, &data, epoch, rounds);
        benchmark("tch/enc", run_tch_enc, &data, epoch, rounds);
        benchmark("tch/dec", run_tch_dec, &data, epoch, rounds);
    }
    return 0;
}
