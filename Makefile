KYBERDIR = kyber/ref
KYBERSOURCES = $(KYBERDIR)/kem.c \
			   $(KYBERDIR)/indcpa.c \
			   $(KYBERDIR)/polyvec.c \
			   $(KYBERDIR)/poly.c \
			   $(KYBERDIR)/ntt.c \
			   $(KYBERDIR)/cbd.c \
			   $(KYBERDIR)/reduce.c \
			   $(KYBERDIR)/verify.c \
			   $(KYBERDIR)/randombytes.c \
			   $(KYBERDIR)/fips202.c \
			   $(KYBERDIR)/symmetric-shake.c
KYBERHEADERS = $(KYBERDIR)/params.h \
			   $(KYBERDIR)/kem.h \
			   $(KYBERDIR)/indcpa.h \
			   $(KYBERDIR)/polyvec.h \
			   $(KYBERDIR)/poly.h \
			   $(KYBERDIR)/ntt.h \
			   $(KYBERDIR)/cbd.h \
			   $(KYBERDIR)/reduce.c \
			   $(KYBERDIR)/verify.h \
			   $(KYBERDIR)/symmetric.h \
			   $(KYBERDIR)/fips202.h

MCELIECE348864HEADERS = easy-mceliece/mceliece348864/api.h \
						easy-mceliece/mceliece348864/benes.h \
						easy-mceliece/mceliece348864/bm.h \
						easy-mceliece/mceliece348864/controlbits.h \
						easy-mceliece/mceliece348864/crypto_hash.h \
						easy-mceliece/mceliece348864/crypto_kem.h \
						easy-mceliece/mceliece348864/crypto_kem_mceliece348864.h \
						easy-mceliece/mceliece348864/decrypt.h \
						easy-mceliece/mceliece348864/encrypt.h \
						easy-mceliece/mceliece348864/gf.h \
						easy-mceliece/mceliece348864/int32_sort.h \
						easy-mceliece/mceliece348864/keccak.h \
						easy-mceliece/mceliece348864/operations.h \
						easy-mceliece/mceliece348864/params.h \
						easy-mceliece/mceliece348864/pk_gen.h \
						easy-mceliece/mceliece348864/randombytes.h \
						easy-mceliece/mceliece348864/root.h \
						easy-mceliece/mceliece348864/sk_gen.h \
						easy-mceliece/mceliece348864/synd.h \
						easy-mceliece/mceliece348864/transpose.h \
						easy-mceliece/mceliece348864/uint64_sort.h \
						easy-mceliece/mceliece348864/util.h \
						easy-mceliece/mceliece348864/subroutines/crypto_declassify.h \
						easy-mceliece/mceliece348864/subroutines/crypto_int16.h \
						easy-mceliece/mceliece348864/subroutines/crypto_int32.h \
						easy-mceliece/mceliece348864/subroutines/crypto_uint16.h \
						easy-mceliece/mceliece348864/subroutines/crypto_uint32.h \
						easy-mceliece/mceliece348864/subroutines/crypto_uint64.h

MCELIECE348864SOURCES = easy-mceliece/mceliece348864/benes.c \
						easy-mceliece/mceliece348864/bm.c \
						easy-mceliece/mceliece348864/controlbits.c \
						easy-mceliece/mceliece348864/decrypt.c \
						easy-mceliece/mceliece348864/encrypt.c \
						easy-mceliece/mceliece348864/gf.c \
						easy-mceliece/mceliece348864/keccak.c \
						easy-mceliece/mceliece348864/operations.c \
						easy-mceliece/mceliece348864/pk_gen.c \
						easy-mceliece/mceliece348864/randombytes.c \
						easy-mceliece/mceliece348864/root.c \
						easy-mceliece/mceliece348864/sk_gen.c \
						easy-mceliece/mceliece348864/synd.c \
						easy-mceliece/mceliece348864/transpose.c \
						easy-mceliece/mceliece348864/util.c

MCELIECE460896HEADERS = easy-mceliece/mceliece460896/api.h \
						easy-mceliece/mceliece460896/benes.h \
						easy-mceliece/mceliece460896/bm.h \
						easy-mceliece/mceliece460896/controlbits.h \
						easy-mceliece/mceliece460896/crypto_hash.h \
						easy-mceliece/mceliece460896/crypto_kem.h \
						easy-mceliece/mceliece460896/crypto_kem_mceliece460896.h \
						easy-mceliece/mceliece460896/decrypt.h \
						easy-mceliece/mceliece460896/encrypt.h \
						easy-mceliece/mceliece460896/gf.h \
						easy-mceliece/mceliece460896/int32_sort.h \
						easy-mceliece/mceliece460896/keccak.h \
						easy-mceliece/mceliece460896/operations.h \
						easy-mceliece/mceliece460896/params.h \
						easy-mceliece/mceliece460896/pk_gen.h \
						easy-mceliece/mceliece460896/randombytes.h \
						easy-mceliece/mceliece460896/root.h \
						easy-mceliece/mceliece460896/sk_gen.h \
						easy-mceliece/mceliece460896/synd.h \
						easy-mceliece/mceliece460896/transpose.h \
						easy-mceliece/mceliece460896/uint64_sort.h \
						easy-mceliece/mceliece460896/util.h \
						easy-mceliece/mceliece460896/subroutines/crypto_declassify.h \
						easy-mceliece/mceliece460896/subroutines/crypto_int16.h \
						easy-mceliece/mceliece460896/subroutines/crypto_int32.h \
						easy-mceliece/mceliece460896/subroutines/crypto_uint16.h \
						easy-mceliece/mceliece460896/subroutines/crypto_uint32.h \
						easy-mceliece/mceliece460896/subroutines/crypto_uint64.h

MCELIECE460896SOURCES = easy-mceliece/mceliece460896/benes.c \
						easy-mceliece/mceliece460896/bm.c \
						easy-mceliece/mceliece460896/controlbits.c \
						easy-mceliece/mceliece460896/decrypt.c \
						easy-mceliece/mceliece460896/encrypt.c \
						easy-mceliece/mceliece460896/gf.c \
						easy-mceliece/mceliece460896/keccak.c \
						easy-mceliece/mceliece460896/operations.c \
						easy-mceliece/mceliece460896/pk_gen.c \
						easy-mceliece/mceliece460896/randombytes.c \
						easy-mceliece/mceliece460896/root.c \
						easy-mceliece/mceliece460896/sk_gen.c \
						easy-mceliece/mceliece460896/synd.c \
						easy-mceliece/mceliece460896/transpose.c \
						easy-mceliece/mceliece460896/util.c

MCELIECE6688128HEADERS = easy-mceliece/mceliece6688128/api.h \
						 easy-mceliece/mceliece6688128/benes.h \
						 easy-mceliece/mceliece6688128/bm.h \
						 easy-mceliece/mceliece6688128/controlbits.h \
						 easy-mceliece/mceliece6688128/crypto_hash.h \
						 easy-mceliece/mceliece6688128/crypto_kem.h \
						 easy-mceliece/mceliece6688128/crypto_kem_mceliece6688128.h \
						 easy-mceliece/mceliece6688128/decrypt.h \
						 easy-mceliece/mceliece6688128/encrypt.h \
						 easy-mceliece/mceliece6688128/gf.h \
						 easy-mceliece/mceliece6688128/int32_sort.h \
						 easy-mceliece/mceliece6688128/keccak.h \
						 easy-mceliece/mceliece6688128/operations.h \
						 easy-mceliece/mceliece6688128/params.h \
						 easy-mceliece/mceliece6688128/pk_gen.h \
						 easy-mceliece/mceliece6688128/randombytes.h \
						 easy-mceliece/mceliece6688128/root.h \
						 easy-mceliece/mceliece6688128/sk_gen.h \
						 easy-mceliece/mceliece6688128/synd.h \
						 easy-mceliece/mceliece6688128/transpose.h \
						 easy-mceliece/mceliece6688128/uint64_sort.h \
						 easy-mceliece/mceliece6688128/util.h \
						 easy-mceliece/mceliece6688128/subroutines/crypto_declassify.h \
						 easy-mceliece/mceliece6688128/subroutines/crypto_int16.h \
						 easy-mceliece/mceliece6688128/subroutines/crypto_int32.h \
						 easy-mceliece/mceliece6688128/subroutines/crypto_uint16.h \
						 easy-mceliece/mceliece6688128/subroutines/crypto_uint32.h \
						 easy-mceliece/mceliece6688128/subroutines/crypto_uint64.h

MCELIECE6688128SOURCES = easy-mceliece/mceliece6688128/benes.c \
						 easy-mceliece/mceliece6688128/bm.c \
						 easy-mceliece/mceliece6688128/controlbits.c \
						 easy-mceliece/mceliece6688128/decrypt.c \
						 easy-mceliece/mceliece6688128/encrypt.c \
						 easy-mceliece/mceliece6688128/gf.c \
						 easy-mceliece/mceliece6688128/keccak.c \
						 easy-mceliece/mceliece6688128/operations.c \
						 easy-mceliece/mceliece6688128/pk_gen.c \
						 easy-mceliece/mceliece6688128/randombytes.c \
						 easy-mceliece/mceliece6688128/root.c \
						 easy-mceliece/mceliece6688128/sk_gen.c \
						 easy-mceliece/mceliece6688128/synd.c \
						 easy-mceliece/mceliece6688128/transpose.c \
						 easy-mceliece/mceliece6688128/util.c

MCELIECE6960119HEADERS = easy-mceliece/mceliece6960119/api.h \
						 easy-mceliece/mceliece6960119/benes.h \
						 easy-mceliece/mceliece6960119/bm.h \
						 easy-mceliece/mceliece6960119/controlbits.h \
						 easy-mceliece/mceliece6960119/crypto_hash.h \
						 easy-mceliece/mceliece6960119/crypto_kem.h \
						 easy-mceliece/mceliece6960119/crypto_kem_mceliece6960119.h \
						 easy-mceliece/mceliece6960119/decrypt.h \
						 easy-mceliece/mceliece6960119/encrypt.h \
						 easy-mceliece/mceliece6960119/gf.h \
						 easy-mceliece/mceliece6960119/int32_sort.h \
						 easy-mceliece/mceliece6960119/keccak.h \
						 easy-mceliece/mceliece6960119/operations.h \
						 easy-mceliece/mceliece6960119/params.h \
						 easy-mceliece/mceliece6960119/pk_gen.h \
						 easy-mceliece/mceliece6960119/randombytes.h \
						 easy-mceliece/mceliece6960119/root.h \
						 easy-mceliece/mceliece6960119/sk_gen.h \
						 easy-mceliece/mceliece6960119/synd.h \
						 easy-mceliece/mceliece6960119/transpose.h \
						 easy-mceliece/mceliece6960119/uint64_sort.h \
						 easy-mceliece/mceliece6960119/util.h \
						 easy-mceliece/mceliece6960119/subroutines/crypto_declassify.h \
						 easy-mceliece/mceliece6960119/subroutines/crypto_int16.h \
						 easy-mceliece/mceliece6960119/subroutines/crypto_int32.h \
						 easy-mceliece/mceliece6960119/subroutines/crypto_uint16.h \
						 easy-mceliece/mceliece6960119/subroutines/crypto_uint32.h \
						 easy-mceliece/mceliece6960119/subroutines/crypto_uint64.h

MCELIECE6960119SOURCES = easy-mceliece/mceliece6960119/benes.c \
						 easy-mceliece/mceliece6960119/bm.c \
						 easy-mceliece/mceliece6960119/controlbits.c \
						 easy-mceliece/mceliece6960119/decrypt.c \
						 easy-mceliece/mceliece6960119/encrypt.c \
						 easy-mceliece/mceliece6960119/gf.c \
						 easy-mceliece/mceliece6960119/keccak.c \
						 easy-mceliece/mceliece6960119/operations.c \
						 easy-mceliece/mceliece6960119/pk_gen.c \
						 easy-mceliece/mceliece6960119/randombytes.c \
						 easy-mceliece/mceliece6960119/root.c \
						 easy-mceliece/mceliece6960119/sk_gen.c \
						 easy-mceliece/mceliece6960119/synd.c \
						 easy-mceliece/mceliece6960119/transpose.c \
						 easy-mceliece/mceliece6960119/util.c

MCELIECE8192128HEADERS = easy-mceliece/mceliece8192128/api.h \
						 easy-mceliece/mceliece8192128/benes.h \
						 easy-mceliece/mceliece8192128/bm.h \
						 easy-mceliece/mceliece8192128/controlbits.h \
						 easy-mceliece/mceliece8192128/crypto_hash.h \
						 easy-mceliece/mceliece8192128/crypto_kem.h \
						 easy-mceliece/mceliece8192128/crypto_kem_mceliece8192128.h \
						 easy-mceliece/mceliece8192128/decrypt.h \
						 easy-mceliece/mceliece8192128/encrypt.h \
						 easy-mceliece/mceliece8192128/gf.h \
						 easy-mceliece/mceliece8192128/int32_sort.h \
						 easy-mceliece/mceliece8192128/keccak.h \
						 easy-mceliece/mceliece8192128/operations.h \
						 easy-mceliece/mceliece8192128/params.h \
						 easy-mceliece/mceliece8192128/pk_gen.h \
						 easy-mceliece/mceliece8192128/randombytes.h \
						 easy-mceliece/mceliece8192128/root.h \
						 easy-mceliece/mceliece8192128/sk_gen.h \
						 easy-mceliece/mceliece8192128/synd.h \
						 easy-mceliece/mceliece8192128/transpose.h \
						 easy-mceliece/mceliece8192128/uint64_sort.h \
						 easy-mceliece/mceliece8192128/util.h \
						 easy-mceliece/mceliece8192128/subroutines/crypto_declassify.h \
						 easy-mceliece/mceliece8192128/subroutines/crypto_int16.h \
						 easy-mceliece/mceliece8192128/subroutines/crypto_int32.h \
						 easy-mceliece/mceliece8192128/subroutines/crypto_uint16.h \
						 easy-mceliece/mceliece8192128/subroutines/crypto_uint32.h \
						 easy-mceliece/mceliece8192128/subroutines/crypto_uint64.h

MCELIECE8192128SOURCES = easy-mceliece/mceliece8192128/benes.c \
						 easy-mceliece/mceliece8192128/bm.c \
						 easy-mceliece/mceliece8192128/controlbits.c \
						 easy-mceliece/mceliece8192128/decrypt.c \
						 easy-mceliece/mceliece8192128/encrypt.c \
						 easy-mceliece/mceliece8192128/gf.c \
						 easy-mceliece/mceliece8192128/keccak.c \
						 easy-mceliece/mceliece8192128/operations.c \
						 easy-mceliece/mceliece8192128/pk_gen.c \
						 easy-mceliece/mceliece8192128/randombytes.c \
						 easy-mceliece/mceliece8192128/root.c \
						 easy-mceliece/mceliece8192128/sk_gen.c \
						 easy-mceliece/mceliece8192128/synd.c \
						 easy-mceliece/mceliece8192128/transpose.c \
						 easy-mceliece/mceliece8192128/util.c

SOURCES = authenticators.c etmkem.c pke.c speed.c
HEADERS = authenticators.h etmkem.h pke.h speed.h

# OpenSSL header files should be included using the CFLAGS environment variables:
# for example `export CFLAGS="-I/path/to/openssl/include $CFLAGS"`
CFLAGS += -O3 -Wno-incompatible-pointer-types-discards-qualifiers # -Wall -Wextra -Wpedantic -Wmissing-prototypes -Wredundant-decls -Wshadow -Wpointer-arith -fomit-frame-pointer -Wno-incompatible-pointer-types
# OpenSSL library files are included using the LDFLAGS environment variable:
# `export LDFLAGS="-L/path/to/opensl/lib $LDFLAGS"
LDFLAGS += -lcrypto

# phony targets will be rerun everytime even if the input files did not change
.PHONY = main tests speed speed_mlkem speed_mceliece speed_etmkem

main: $(SOURCES) $(HEADERS) main.c
	$(CC) $(CFLAGS) $(LDFLAGS) $(KYBERSOURCES) $(SOURCES) -DPKE_KYBER -DMAC_POLY1305 main.c -o target/$@
	./target/$@

all: tests speed

tests: test_pke_correctness test_etmkem_correctness

speed: speed_mlkem speed_mceliece speed_etmkem

test_pke_correctness: $(SOURCES) $(HEADERS) test_pke_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) $(KYBERSOURCES) pke.c -DPKE_KYBER -DKYBER_K=2 test_pke_correctness.c -o target/test_pke_kyber512_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) $(KYBERSOURCES) pke.c -DPKE_KYBER -DKYBER_K=3 test_pke_correctness.c -o target/test_pke_kyber768_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) $(KYBERSOURCES) pke.c -DPKE_KYBER -DKYBER_K=4 test_pke_correctness.c -o target/test_pke_kyber1024_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) $(MCELIECE348864SOURCES) pke.c -DPKE_MCELIECE348864 test_pke_correctness.c -o target/test_pke_mceliece348864_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) $(MCELIECE460896SOURCES) pke.c -DPKE_MCELIECE460896 test_pke_correctness.c -o target/test_pke_mceliece460896_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) $(MCELIECE6688128SOURCES) pke.c -DPKE_MCELIECE6688128 test_pke_correctness.c -o target/test_pke_mceliece6688128_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) $(MCELIECE6960119SOURCES) pke.c -DPKE_MCELIECE6960119 test_pke_correctness.c -o target/test_pke_mceliece6960119_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) $(MCELIECE8192128SOURCES) pke.c -DPKE_MCELIECE8192128 test_pke_correctness.c -o target/test_pke_mceliece8192128_correctness
	time ./target/test_pke_kyber512_correctness
	time ./target/test_pke_kyber768_correctness
	time ./target/test_pke_kyber1024_correctness
	time ./target/test_pke_mceliece348864_correctness
	time ./target/test_pke_mceliece460896_correctness
	time ./target/test_pke_mceliece6688128_correctness
	time ./target/test_pke_mceliece6960119_correctness
	time ./target/test_pke_mceliece8192128_correctness

# Copy from test_etmkem_speed, then replace speed with correctness
test_etmkem_correctness: $(SOURCES) $(HEADERS) test_etmkem_correctness.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=2 -DMAC_POLY1305 $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber512_poly1305_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=2 -DMAC_GMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber512_gmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=2 -DMAC_CMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber512_cmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=2 -DMAC_KMAC256 $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber512_kmac256_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=3 -DMAC_POLY1305 $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber768_poly1305_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=3 -DMAC_GMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber768_gmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=3 -DMAC_CMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber768_cmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=3 -DMAC_KMAC256 $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber768_kmac256_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=4 -DMAC_POLY1305 $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber1024_poly1305_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=4 -DMAC_GMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber1024_gmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=4 -DMAC_CMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber1024_cmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=4 -DMAC_KMAC256 $(KYBERSOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_kyber1024_kmac256_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE348864 -DMAC_POLY1305 $(MCELIECE348864SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece348864_poly1305_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE348864 -DMAC_GMAC $(MCELIECE348864SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece348864_gmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE348864 -DMAC_CMAC $(MCELIECE348864SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece348864_cmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE348864 -DMAC_KMAC256 $(MCELIECE348864SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece348864_kmac256_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE460896 -DMAC_POLY1305 $(MCELIECE460896SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece460896_poly1305_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE460896 -DMAC_GMAC $(MCELIECE460896SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece460896_gmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE460896 -DMAC_CMAC $(MCELIECE460896SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece460896_cmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE460896 -DMAC_KMAC256 $(MCELIECE460896SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece460896_kmac256_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6688128 -DMAC_POLY1305 $(MCELIECE6688128SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece6688128_poly1305_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6688128 -DMAC_GMAC $(MCELIECE6688128SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece6688128_gmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6688128 -DMAC_CMAC $(MCELIECE6688128SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece6688128_cmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6688128 -DMAC_KMAC256 $(MCELIECE6688128SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece6688128_kmac256_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6960119 -DMAC_POLY1305 $(MCELIECE6960119SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece6960119_poly1305_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6960119 -DMAC_GMAC $(MCELIECE6960119SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece6960119_gmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6960119 -DMAC_CMAC $(MCELIECE6960119SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece6960119_cmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6960119 -DMAC_KMAC256 $(MCELIECE6960119SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece6960119_kmac256_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE8192128 -DMAC_POLY1305 $(MCELIECE8192128SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece8192128_poly1305_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE8192128 -DMAC_GMAC $(MCELIECE8192128SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece8192128_gmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE8192128 -DMAC_CMAC $(MCELIECE8192128SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece8192128_cmac_correctness
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE8192128 -DMAC_KMAC256 $(MCELIECE8192128SOURCES) $(SOURCES) test_etmkem_correctness.c -o target/test_mceliece8192128_kmac256_correctness
	./target/test_kyber512_poly1305_correctness
	./target/test_kyber512_gmac_correctness
	./target/test_kyber512_cmac_correctness
	./target/test_kyber512_kmac256_correctness
	./target/test_kyber768_poly1305_correctness
	./target/test_kyber768_gmac_correctness
	./target/test_kyber768_cmac_correctness
	./target/test_kyber768_kmac256_correctness
	./target/test_kyber1024_poly1305_correctness
	./target/test_kyber1024_gmac_correctness
	./target/test_kyber1024_cmac_correctness
	./target/test_kyber1024_kmac256_correctness
	./target/test_mceliece348864_poly1305_correctness
	./target/test_mceliece348864_gmac_correctness
	./target/test_mceliece348864_cmac_correctness
	./target/test_mceliece348864_kmac256_correctness
	./target/test_mceliece460896_poly1305_correctness
	./target/test_mceliece460896_gmac_correctness
	./target/test_mceliece460896_cmac_correctness
	./target/test_mceliece460896_kmac256_correctness
	./target/test_mceliece6688128_poly1305_correctness
	./target/test_mceliece6688128_gmac_correctness
	./target/test_mceliece6688128_cmac_correctness
	./target/test_mceliece6688128_kmac256_correctness
	./target/test_mceliece6960119_poly1305_correctness
	./target/test_mceliece6960119_gmac_correctness
	./target/test_mceliece6960119_cmac_correctness
	./target/test_mceliece6960119_kmac256_correctness
	./target/test_mceliece8192128_poly1305_correctness
	./target/test_mceliece8192128_gmac_correctness
	./target/test_mceliece8192128_cmac_correctness
	./target/test_mceliece8192128_kmac256_correctness

speed_mlkem: $(SOURCES) $(HEADERS) test_mlkem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DKYBER_K=2 $(KYBERSOURCES) speed.c test_mlkem_speed.c -o target/test_mlkem512_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DKYBER_K=3 $(KYBERSOURCES) speed.c test_mlkem_speed.c -o target/test_mlkem768_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DKYBER_K=4 $(KYBERSOURCES) speed.c test_mlkem_speed.c -o target/test_mlkem1024_speed
	./target/test_mlkem512_speed
	./target/test_mlkem768_speed
	./target/test_mlkem1024_speed

speed_mceliece: $(SOURCES) $(HEADERS) test_mceliece_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE348864 $(MCELIECE348864SOURCES) speed.c test_mceliece_speed.c -o target/test_mceliece348864_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE460896 $(MCELIECE460896SOURCES) speed.c test_mceliece_speed.c -o target/test_mceliece460896_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6688128 $(MCELIECE6688128SOURCES) speed.c test_mceliece_speed.c -o target/test_mceliece6688128_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6960119 $(MCELIECE6960119SOURCES) speed.c test_mceliece_speed.c -o target/test_mceliece6960119_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE8192128 $(MCELIECE8192128SOURCES) speed.c test_mceliece_speed.c -o target/test_mceliece8192128_speed
	./target/test_mceliece348864_speed
	./target/test_mceliece460896_speed
	./target/test_mceliece6688128_speed
	./target/test_mceliece6960119_speed
	./target/test_mceliece8192128_speed

# commands generated by cmdgen.py:gen_test_etmkem_speed_cmds
speed_etmkem: $(SOURCES) $(HEADERS) test_etmkem_speed.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=2 -DMAC_POLY1305 $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber512_poly1305_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=2 -DMAC_GMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber512_gmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=2 -DMAC_CMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber512_cmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=2 -DMAC_KMAC256 $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber512_kmac256_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=3 -DMAC_POLY1305 $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber768_poly1305_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=3 -DMAC_GMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber768_gmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=3 -DMAC_CMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber768_cmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=3 -DMAC_KMAC256 $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber768_kmac256_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=4 -DMAC_POLY1305 $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber1024_poly1305_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=4 -DMAC_GMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber1024_gmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=4 -DMAC_CMAC $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber1024_cmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_KYBER -DKYBER_K=4 -DMAC_KMAC256 $(KYBERSOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_kyber1024_kmac256_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE348864 -DMAC_POLY1305 $(MCELIECE348864SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece348864_poly1305_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE348864 -DMAC_GMAC $(MCELIECE348864SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece348864_gmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE348864 -DMAC_CMAC $(MCELIECE348864SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece348864_cmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE348864 -DMAC_KMAC256 $(MCELIECE348864SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece348864_kmac256_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE460896 -DMAC_POLY1305 $(MCELIECE460896SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece460896_poly1305_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE460896 -DMAC_GMAC $(MCELIECE460896SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece460896_gmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE460896 -DMAC_CMAC $(MCELIECE460896SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece460896_cmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE460896 -DMAC_KMAC256 $(MCELIECE460896SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece460896_kmac256_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6688128 -DMAC_POLY1305 $(MCELIECE6688128SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece6688128_poly1305_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6688128 -DMAC_GMAC $(MCELIECE6688128SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece6688128_gmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6688128 -DMAC_CMAC $(MCELIECE6688128SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece6688128_cmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6688128 -DMAC_KMAC256 $(MCELIECE6688128SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece6688128_kmac256_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6960119 -DMAC_POLY1305 $(MCELIECE6960119SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece6960119_poly1305_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6960119 -DMAC_GMAC $(MCELIECE6960119SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece6960119_gmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6960119 -DMAC_CMAC $(MCELIECE6960119SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece6960119_cmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE6960119 -DMAC_KMAC256 $(MCELIECE6960119SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece6960119_kmac256_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE8192128 -DMAC_POLY1305 $(MCELIECE8192128SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece8192128_poly1305_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE8192128 -DMAC_GMAC $(MCELIECE8192128SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece8192128_gmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE8192128 -DMAC_CMAC $(MCELIECE8192128SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece8192128_cmac_speed
	$(CC) $(CFLAGS) $(LDFLAGS) -DPKE_MCELIECE8192128 -DMAC_KMAC256 $(MCELIECE8192128SOURCES) $(SOURCES) test_etmkem_speed.c -o target/test_mceliece8192128_kmac256_speed
	./target/test_kyber512_poly1305_speed
	./target/test_kyber512_gmac_speed
	./target/test_kyber512_cmac_speed
	./target/test_kyber512_kmac256_speed
	./target/test_kyber768_poly1305_speed
	./target/test_kyber768_gmac_speed
	./target/test_kyber768_cmac_speed
	./target/test_kyber768_kmac256_speed
	./target/test_kyber1024_poly1305_speed
	./target/test_kyber1024_gmac_speed
	./target/test_kyber1024_cmac_speed
	./target/test_kyber1024_kmac256_speed
	./target/test_mceliece348864_poly1305_speed
	./target/test_mceliece348864_gmac_speed
	./target/test_mceliece348864_cmac_speed
	./target/test_mceliece348864_kmac256_speed
	./target/test_mceliece460896_poly1305_speed
	./target/test_mceliece460896_gmac_speed
	./target/test_mceliece460896_cmac_speed
	./target/test_mceliece460896_kmac256_speed
	./target/test_mceliece6688128_poly1305_speed
	./target/test_mceliece6688128_gmac_speed
	./target/test_mceliece6688128_cmac_speed
	./target/test_mceliece6688128_kmac256_speed
	./target/test_mceliece6960119_poly1305_speed
	./target/test_mceliece6960119_gmac_speed
	./target/test_mceliece6960119_cmac_speed
	./target/test_mceliece6960119_kmac256_speed
	./target/test_mceliece8192128_poly1305_speed
	./target/test_mceliece8192128_gmac_speed
	./target/test_mceliece8192128_cmac_speed
	./target/test_mceliece8192128_kmac256_speed


clean:
	$(RM) target/*
