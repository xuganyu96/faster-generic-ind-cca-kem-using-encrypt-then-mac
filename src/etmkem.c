#include <stddef.h>
#include <stdint.h>
#include <string.h>

#include "pqqs26/pqqs26.h"

static void evp_mac_poly1305(unsigned char *tag, const unsigned char *inp,
                             unsigned int inp_len, const unsigned char *key,
                             unsigned int key_len) {
    // OSSL_PARAM params[4];
    size_t final_l;

    EVP_MAC *mac = EVP_MAC_fetch(NULL, "POLY1305", NULL);
    EVP_MAC_CTX *ctx = NULL;
    ctx = EVP_MAC_CTX_new(mac);

    // params[0] = OSSL_PARAM_construct_utf8_string("cipher","AES-128-GCM", 0);
    // params[1] = OSSL_PARAM_construct_octet_string("iv", iv, iv_len);
    // params[2] = OSSL_PARAM_construct_end();

    // int result = EVP_MAC_init(ctx, key, key_len, params);
    EVP_MAC_init(ctx, key, key_len, NULL);
    EVP_MAC_update(ctx, inp, inp_len);
    EVP_MAC_final(ctx, tag, &final_l, 16);
    EVP_MAC_CTX_free(ctx);
    EVP_MAC_free(mac);
    return;
}

int PQQS26_ETM_crypto_kem_enc(uint8_t *ct, uint8_t *ss, const uint8_t *pk) {
    uint8_t buf[2 * KYBER_SYMBYTES];
    uint8_t buf_r[KYBER_SYMBYTES];
    uint8_t kr[2 * KYBER_SYMBYTES];
    uint8_t tag[KYBER_MACBYTES] = {0};
    uint8_t tmp[KYBER_SYMBYTES + KYBER_MACBYTES];

    randombytes(buf, KYBER_SYMBYTES);
    hash_h(buf, buf, KYBER_SYMBYTES);
    // printf("encaps, buf: ");
    // print_vec(buf, KYBER_SYMBYTES);
    randombytes(buf_r, KYBER_SYMBYTES);

    hash_h(buf + KYBER_SYMBYTES, pk, KYBER_PUBLICKEYBYTES);
    hash_g(kr, buf, 2 * KYBER_SYMBYTES);

    indcpa_enc(ct, buf, pk, buf_r);
    evp_mac_poly1305(tag, ct, CRYPTO_CIPHERTEXTBYTES, kr + KYBER_SYMBYTES,
                     CRYPTO_BYTES);

    memcpy(tmp, kr, KYBER_SYMBYTES);
    memcpy(tmp + KYBER_SYMBYTES, tag, KYBER_MACBYTES);
    kdf(ss, tmp, KYBER_SYMBYTES + KYBER_MACBYTES);
    memcpy(ct + CRYPTO_CIPHERTEXTBYTES, tag, KYBER_MACBYTES);

    return 0;
}

int PQQS26_TCH_crypto_kem_enc(uint8_t *ct, uint8_t *ss, const uint8_t *pk) {
    uint8_t buf[KYBER_SYMBYTES];   // seed to key
    uint8_t buf_r[KYBER_SYMBYTES]; // randomness to K-PKE
    uint8_t tmp[KYBER_SYMBYTES + KYBER_CIPHERTEXTBYTES];
    uint8_t tag1[KYBER_SYMBYTES] = {0};

    randombytes(buf, KYBER_SYMBYTES);
    hash_h(buf, buf, KYBER_SYMBYTES);
    randombytes(buf_r, KYBER_SYMBYTES);
    /* coins are in buf_r */
    // printf("encpas, buf: ");
    // print_vec(buf, KYBER_SYMBYTES);
    indcpa_enc(ct, buf, pk, buf_r);

    memcpy(tmp, ct, KYBER_CIPHERTEXTBYTES);
    memcpy(tmp + KYBER_CIPHERTEXTBYTES, buf, KYBER_SYMBYTES);
    hash_h(tag1, tmp, KYBER_CIPHERTEXTBYTES + KYBER_SYMBYTES);
    memcpy(ct + CRYPTO_CIPHERTEXTBYTES, tag1, KYBER_SYMBYTES);
    hash_h(ss, buf, KYBER_SYMBYTES);
    return 0;
}

int PQQS26_ETM_crypto_kem_dec(uint8_t *ss, const uint8_t *ct,
                              const uint8_t *sk) {
    int fail;
    uint8_t buf[2 * KYBER_SYMBYTES];
    /* Will contain key, coins */
    uint8_t kr[2 * KYBER_SYMBYTES];
    uint8_t tag[KYBER_MACBYTES] = {0};
    uint8_t tmp[KYBER_SYMBYTES + KYBER_MACBYTES];
    uint8_t tmp1[KYBER_SYMBYTES + CRYPTO_CIPHERTEXTBYTES];

#if defined(__x86_64__) && defined(USE_AVX2)
    ALIGNED_UINT8(KYBER_CIPHERTEXTBYTES) cmp;
    (void) cmp;
#endif /* __x86_64__ */
    // const uint8_t *pk = sk + KYBER_INDCPA_SECRETKEYBYTES;

    indcpa_dec(buf, ct, sk);
    // printf("decpas, buf: ");
    // print_vec(buf, KYBER_SYMBYTES);

    memcpy(buf + KYBER_SYMBYTES, sk + KYBER_SECRETKEYBYTES - 2 * KYBER_SYMBYTES,
           KYBER_SYMBYTES);
    hash_g(kr, buf, 2 * KYBER_SYMBYTES);

    evp_mac_poly1305(tag, ct, CRYPTO_CIPHERTEXTBYTES, kr + KYBER_SYMBYTES,
                     CRYPTO_BYTES);

    if (memcmp(ct + CRYPTO_CIPHERTEXTBYTES, tag, KYBER_MACBYTES) == 0) {
        memcpy(tmp, kr, KYBER_SYMBYTES);
        memcpy(tmp + KYBER_SYMBYTES, tag, KYBER_MACBYTES);
        kdf(ss, tmp, KYBER_SYMBYTES + KYBER_MACBYTES);
    } else {
        memcpy(tmp1, kr, KYBER_SYMBYTES);
        memcpy(tmp1 + KYBER_SYMBYTES, ct, CRYPTO_CIPHERTEXTBYTES);
        kdf(ss, tmp1, KYBER_SYMBYTES + CRYPTO_CIPHERTEXTBYTES);
#ifdef VERBOSE
        printf("Fail...\n");
#else
        (void)fail;
#endif /* VERBOSE */
    }
    return 0;
}

int PQQS26_TCH_crypto_kem_dec(uint8_t *ss, const uint8_t *ct,
                              const uint8_t *sk) {
    // int fail;
    uint8_t buf[KYBER_SYMBYTES];
    uint8_t tag[KYBER_SYMBYTES] = {0};
    uint8_t tmp[KYBER_SYMBYTES + KYBER_CIPHERTEXTBYTES];

#if defined(__x86_64__) && defined(USE_AVX2)
    ALIGNED_UINT8(KYBER_CIPHERTEXTBYTES) cmp;
    (void)cmp;
#endif /* __x86_64__ */
    // const uint8_t *pk = sk + KYBER_INDCPA_SECRETKEYBYTES;

    indcpa_dec(buf, ct, sk);
    // printf("decpas, buf: ");
    // print_vec(buf, KYBER_SYMBYTES);

    memcpy(tmp, ct, KYBER_CIPHERTEXTBYTES);
    memcpy(tmp + KYBER_CIPHERTEXTBYTES, buf, KYBER_SYMBYTES);
    hash_h(tag, tmp, KYBER_CIPHERTEXTBYTES + KYBER_SYMBYTES);

    if (memcmp(ct + CRYPTO_CIPHERTEXTBYTES, tag, KYBER_SYMBYTES) == 0) {
        hash_h(ss, buf, KYBER_SYMBYTES);
        // printf("Success from decaps...\n");
    }
    return 0;
}
