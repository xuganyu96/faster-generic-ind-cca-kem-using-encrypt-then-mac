#ifndef PQQS26_H
#define PQQS26_H

#include <stddef.h>
#include <stdint.h>
#include <string.h>

#if defined(__x86_64__) && defined(USE_AVX2)
#include "pqcrystals-kyber/avx2/fips202.h"
#include "pqcrystals-kyber/avx2/indcpa.h"
#include "pqcrystals-kyber/avx2/kem.h"
#include "pqcrystals-kyber/avx2/params.h"
#include "pqcrystals-kyber/avx2/randombytes.h"
#include "pqcrystals-kyber/avx2/symmetric.h"
#else
#include "pqcrystals-kyber/ref/fips202.h"
#include "pqcrystals-kyber/ref/indcpa.h"
#include "pqcrystals-kyber/ref/kem.h"
#include "pqcrystals-kyber/ref/params.h"
#include "pqcrystals-kyber/ref/randombytes.h"
#include "pqcrystals-kyber/ref/symmetric.h"
#endif

#include <openssl/aes.h>
#include <openssl/crypto.h>
#include <openssl/opensslv.h>
#include <openssl/sha.h>

#include <openssl/core.h>
#include <openssl/err.h>
#include <openssl/evp.h>
#include <openssl/params.h>
#include <openssl/rand.h>

#define KYBER_MACBYTES 16
#define ETM_CIPHERTEXTBYTES (KYBER_CIPHERTEXTBYTES + KYBER_MACBYTES)
#define TCH_CIPHERTEXTBYTES (KYBER_CIPHERTEXTBYTES + KYBER_SYMBYTES)
#define kdf(OUT, IN, INBYTES) shake256(OUT, KYBER_SSBYTES, IN, INBYTES)

#define PQQS26_KYBER_crypto_kem_enc crypto_kem_enc
#define PQQS26_KYBER_crypto_kem_dec crypto_kem_dec

int PQQS26_ETM_crypto_kem_enc(uint8_t *ct, uint8_t *ss, const uint8_t *pk);
int PQQS26_ETM_crypto_kem_dec(uint8_t *ss, const uint8_t *ct,
                              const uint8_t *sk);
int PQQS26_TCH_crypto_kem_enc(uint8_t *ct, uint8_t *ss, const uint8_t *pk);
int PQQS26_TCH_crypto_kem_dec(uint8_t *ss, const uint8_t *ct,
                              const uint8_t *sk);

#endif /* !PQQS26_H */
