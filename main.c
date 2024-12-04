#include "etmkem.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Number of batches
#define BENCH_BATCH_COUNT 1001
// Number of function calls in each batch
#define BENCH_BATCH_SIZE 128

static void println_hexstr(uint8_t *bytes, size_t len) {
  printf("0x");
  for (size_t i = 0; i < len; i++) {
    printf("%02X", bytes[i]);
  }
  printf("\n");
}

static int clock_t_cmp(const void *a, const void *b) {
  if (*(clock_t *)a < *(clock_t *)b) {
    return -1;
  }
  if (*(clock_t *)a > *(clock_t *)b) {
    return 1;
  }
  return 0;
}

/**
 * Compute the number of CPU cycles used to perform encapsulation
 */
static void benchmark_encapsulation_cputime(void) {
  uint8_t kem_pk[ETMKEM_PUBLICKEYBYTES];
  uint8_t kem_sk[ETMKEM_SECRETKEYBYTES];
  uint8_t kem_ct[ETMKEM_CIPHERTEXTBYTES];
  uint8_t kem_ss[ETMKEM_SSBYTES];
  etmkem_keypair(kem_pk, kem_sk);

  clock_t batch_times[BENCH_BATCH_COUNT];

  for (int batch = 0; batch < BENCH_BATCH_COUNT; batch++) {
    clock_t start = clock();
    for (int round = 0; round < BENCH_BATCH_SIZE; round++) {
      etmkem_encap(kem_ct, kem_ss, kem_pk);
    }
    clock_t total_dur = clock() - start;

    clock_t overhead_start = clock();
    for (int round = 0; round < BENCH_BATCH_SIZE; round++)
      ;
    clock_t overhead_dur = clock() - overhead_start;
    batch_times[batch] = (total_dur - overhead_dur) / BENCH_BATCH_SIZE;
  }

  qsort(batch_times, BENCH_BATCH_COUNT, sizeof(clock_t), clock_t_cmp);
  clock_t medium = batch_times[(BENCH_BATCH_COUNT - 1) / 2];
  printf("Encapsulation medium time is %lu\n", medium);
}

/**
 * Compute the number of CPU cycles used to perform encapsulation
 */
static void benchmark_decapsulation_cputime(void) {
  uint8_t kem_pk[ETMKEM_PUBLICKEYBYTES];
  uint8_t kem_sk[ETMKEM_SECRETKEYBYTES];
  uint8_t kem_ct[ETMKEM_CIPHERTEXTBYTES];
  uint8_t kem_ss[ETMKEM_SSBYTES];
  etmkem_keypair(kem_pk, kem_sk);
  etmkem_encap(kem_ct, kem_ss, kem_pk);

  clock_t batch_times[BENCH_BATCH_COUNT];

  for (int batch = 0; batch < BENCH_BATCH_COUNT; batch++) {
    clock_t start = clock();
    for (int round = 0; round < BENCH_BATCH_SIZE; round++) {
      etmkem_decap(kem_ss, kem_ct, kem_sk);
    }
    clock_t total_dur = clock() - start;

    clock_t overhead_start = clock();
    for (int round = 0; round < BENCH_BATCH_SIZE; round++)
      ;
    clock_t overhead_dur = clock() - overhead_start;
    batch_times[batch] = (total_dur - overhead_dur) / BENCH_BATCH_SIZE;
  }

  qsort(batch_times, BENCH_BATCH_COUNT, sizeof(clock_t), clock_t_cmp);
  clock_t medium = batch_times[(BENCH_BATCH_COUNT - 1) / 2];
  printf("Decapsulation medium time is %lu\n", medium);
}

int main(void) {
  benchmark_encapsulation_cputime();
  benchmark_decapsulation_cputime();
  return 0;
}
