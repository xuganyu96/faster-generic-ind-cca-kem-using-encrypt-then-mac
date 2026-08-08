/**
 * @file test_kem.c
 * @summary Generate a keypair, encapsulate a secret, decapsulate the
 * ciphertext, then compare the decapsulation with the encapsulation
 */

#include "pqqs26/pqqs26.h"

int main(void) {
    uint8_t pk[KYBER_PUBLICKEYBYTES], sk[KYBER_SECRETKEYBYTES],
        kyber_ct[KYBER_CIPHERTEXTBYTES], ss[KYBER_SSBYTES],
        ss_cmp[KYBER_SSBYTES], etm_ct[ETM_CIPHERTEXTBYTES],
        tch_ct[TCH_CIPHERTEXTBYTES];

    crypto_kem_keypair(pk, sk);
    PQQS26_KYBER_crypto_kem_enc(kyber_ct, ss, pk);
    PQQS26_KYBER_crypto_kem_dec(ss_cmp, kyber_ct, sk);
    if (memcmp(ss, ss_cmp, KYBER_SSBYTES) != 0) {
        fprintf(stderr, "ERROR: Kyber decapsulation incorrect\n");
    }

    crypto_kem_keypair(pk, sk);
    PQQS26_ETM_crypto_kem_enc(etm_ct, ss, pk);
    PQQS26_ETM_crypto_kem_dec(ss_cmp, etm_ct, sk);
    if (memcmp(ss, ss_cmp, KYBER_SSBYTES) != 0) {
        fprintf(stderr, "ERROR: ETM decapsulation incorrect\n");
    }

    crypto_kem_keypair(pk, sk);
    PQQS26_TCH_crypto_kem_enc(tch_ct, ss, pk);
    PQQS26_TCH_crypto_kem_dec(ss_cmp, tch_ct, sk);
    if (memcmp(ss, ss_cmp, KYBER_SSBYTES) != 0) {
        fprintf(stderr, "ERROR: TCH decapsulation incorrect\n");
    }

    printf("Ok.\n");
    return 0;
}
