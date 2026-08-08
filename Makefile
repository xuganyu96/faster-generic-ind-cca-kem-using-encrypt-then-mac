CC ?= /usr/bin/cc
CFLAGS += -Wall -Wextra -Wpedantic -Wmissing-prototypes -Wredundant-decls \
  -Wshadow -Wpointer-arith -O3 -fomit-frame-pointer \
  -Iinclude -I.
NISTFLAGS += -Wno-unused-result -O3 -fomit-frame-pointer

KYBER_REF = pqcrystals-kyber/ref
REF_SOURCES = $(KYBER_REF)/kem.c \
			  $(KYBER_REF)/indcpa.c \
			  $(KYBER_REF)/polyvec.c \
			  $(KYBER_REF)/poly.c \
			  $(KYBER_REF)/ntt.c \
			  $(KYBER_REF)/cbd.c \
			  $(KYBER_REF)/reduce.c \
			  $(KYBER_REF)/verify.c \
			  $(KYBER_REF)/fips202.c \
			  $(KYBER_REF)/randombytes.c \
			  $(KYBER_REF)/symmetric-shake.c
REF_HEADERS = $(KYBER_REF)/params.h \
			  $(KYBER_REF)/kem.h \
			  $(KYBER_REF)/indcpa.h \
			  $(KYBER_REF)/polyvec.h \
			  $(KYBER_REF)/poly.h \
			  $(KYBER_REF)/ntt.h \
			  $(KYBER_REF)/cbd.h \
			  $(KYBER_REF)/reduce.c \
			  $(KYBER_REF)/verify.h \
			  $(KYBER_REF)/symmetric.h \
			  $(KYBER_REF)/fips202.h

AVX2_CFLAGS = -mavx2 -mbmi2 -mpopcnt -march=native -mtune=native -Ipqcrystals-kyber/avx2 -Ipqcrystals-kyber/avx2/keccak4x
KYBER_AVX2 = pqcrystals-kyber/avx2
AVX2_SOURCES = $(KYBER_AVX2)/kem.c \
			   $(KYBER_AVX2)/indcpa.c \
			   $(KYBER_AVX2)/polyvec.c \
			   $(KYBER_AVX2)/poly.c \
			   $(KYBER_AVX2)/fq.S \
			   $(KYBER_AVX2)/shuffle.S \
			   $(KYBER_AVX2)/ntt.S \
			   $(KYBER_AVX2)/invntt.S \
			   $(KYBER_AVX2)/basemul.S \
			   $(KYBER_AVX2)/consts.c \
			   $(KYBER_AVX2)/rejsample.c \
			   $(KYBER_AVX2)/cbd.c \
			   $(KYBER_AVX2)/verify.c \
			   $(KYBER_AVX2)/fips202.c \
			   $(KYBER_AVX2)/fips202x4.c \
			   $(KYBER_AVX2)/symmetric-shake.c \
			   $(KYBER_AVX2)/randombytes.c \
			   $(KYBER_AVX2)/keccak4x/KeccakP-1600-times4-SIMD256.o
AVX2_HEADERS = $(KYBER_AVX2)/params.h \
			   $(KYBER_AVX2)/align.h \
			   $(KYBER_AVX2)/kem.h \
			   $(KYBER_AVX2)/indcpa.h \
			   $(KYBER_AVX2)/polyvec.h \
			   $(KYBER_AVX2)/poly.h \
			   $(KYBER_AVX2)/reduce.h \
			   $(KYBER_AVX2)/fq.inc \
			   $(KYBER_AVX2)/shuffle.inc \
			   $(KYBER_AVX2)/ntt.h \
			   $(KYBER_AVX2)/consts.h \
			   $(KYBER_AVX2)/rejsample.h \
			   $(KYBER_AVX2)/cbd.h \
			   $(KYBER_AVX2)/verify.h \
			   $(KYBER_AVX2)/symmetric.h \
			   $(KYBER_AVX2)/randombytes.h \
			   $(KYBER_AVX2)/fips202.h \
			   $(KYBER_AVX2)/fips202x4.h

.PHONY: ref avx2 clean

ref: \
	tests/test_kem_512_ref.out \
	tests/test_kem_768_ref.out \
	tests/test_kem_1024_ref.out \
	tests/speed_kem_512_ref.out \
	tests/speed_kem_768_ref.out \
	tests/speed_kem_1024_ref.out

avx2: \
	tests/test_kem_512_avx2.out \
	tests/test_kem_768_avx2.out \
	tests/test_kem_1024_avx2.out \
	tests/speed_kem_512_avx2.out \
	tests/speed_kem_768_avx2.out \
	tests/speed_kem_1024_avx2.out

tests/test_kem_512_ref.out: $(REF_SOURCES) $(REF_HEADERS) src/etmkem.c tests/test_kem.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DKYBER_K=2 $(REF_SOURCES) -lcrypto src/etmkem.c tests/test_kem.c -o $@

tests/test_kem_768_ref.out: $(REF_SOURCES) $(REF_HEADERS) src/etmkem.c tests/test_kem.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DKYBER_K=3 $(REF_SOURCES) -lcrypto src/etmkem.c tests/test_kem.c -o $@

tests/test_kem_1024_ref.out: $(REF_SOURCES) $(REF_HEADERS) src/etmkem.c tests/test_kem.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DKYBER_K=4 $(REF_SOURCES) -lcrypto src/etmkem.c tests/test_kem.c -o $@

tests/speed_kem_512_ref.out: $(REF_SOURCES) $(REF_HEADERS) src/etmkem.c tests/speed_kem.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DKYBER_K=2 $(REF_SOURCES) -lcrypto src/etmkem.c tests/speed_kem.c -o $@

tests/speed_kem_768_ref.out: $(REF_SOURCES) $(REF_HEADERS) src/etmkem.c tests/speed_kem.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DKYBER_K=3 $(REF_SOURCES) -lcrypto src/etmkem.c tests/speed_kem.c -o $@

tests/speed_kem_1024_ref.out: $(REF_SOURCES) $(REF_HEADERS) src/etmkem.c tests/speed_kem.c
	$(CC) $(CFLAGS) $(LDFLAGS) -DKYBER_K=4 $(REF_SOURCES) -lcrypto src/etmkem.c tests/speed_kem.c -o $@

$(KYBER_AVX2)/keccak4x/KeccakP-1600-times4-SIMD256.o: \
  $(KYBER_AVX2)/keccak4x/KeccakP-1600-times4-SIMD256.c \
  $(KYBER_AVX2)/keccak4x/KeccakP-1600-times4-SnP.h \
  $(KYBER_AVX2)/keccak4x/KeccakP-1600-unrolling.macros \
  $(KYBER_AVX2)/keccak4x/KeccakP-SIMD256-config.h \
  $(KYBER_AVX2)/keccak4x/KeccakP-align.h \
  $(KYBER_AVX2)/keccak4x/KeccakP-brg_endian.h
	$(CC) $(CFLAGS) $(AVX2_CFLAGS) -c $< -o $@

tests/test_kem_512_avx2.out: $(AVX2_SOURCES) $(AVX2_HEADERS) src/etmkem.c tests/test_kem.c
	$(CC) $(CFLAGS) $(AVX2_CFLAGS) $(LDFLAGS) -DKYBER_K=2 $(AVX2_SOURCES) -lcrypto -DUSE_AVX2 src/etmkem.c tests/test_kem.c -o $@

tests/test_kem_768_avx2.out: $(AVX2_SOURCES) $(AVX2_HEADERS) src/etmkem.c tests/test_kem.c
	$(CC) $(CFLAGS) $(AVX2_CFLAGS) $(LDFLAGS) -DKYBER_K=3 $(AVX2_SOURCES) -lcrypto -DUSE_AVX2 src/etmkem.c tests/test_kem.c -o $@

tests/test_kem_1024_avx2.out: $(AVX2_SOURCES) $(AVX2_HEADERS) src/etmkem.c tests/test_kem.c
	$(CC) $(CFLAGS) $(AVX2_CFLAGS) $(LDFLAGS) -DKYBER_K=4 $(AVX2_SOURCES) -lcrypto -DUSE_AVX2 src/etmkem.c tests/test_kem.c -o $@

tests/speed_kem_512_avx2.out: $(AVX2_SOURCES) $(AVX2_HEADERS) src/etmkem.c tests/speed_kem.c
	$(CC) $(CFLAGS) $(AVX2_CFLAGS) $(LDFLAGS) -DKYBER_K=2 $(AVX2_SOURCES) -lcrypto -DUSE_AVX2 src/etmkem.c tests/speed_kem.c -o $@

tests/speed_kem_768_avx2.out: $(AVX2_SOURCES) $(AVX2_HEADERS) src/etmkem.c tests/speed_kem.c
	$(CC) $(CFLAGS) $(AVX2_CFLAGS) $(LDFLAGS) -DKYBER_K=3 $(AVX2_SOURCES) -lcrypto -DUSE_AVX2 src/etmkem.c tests/speed_kem.c -o $@

tests/speed_kem_1024_avx2.out: $(AVX2_SOURCES) $(AVX2_HEADERS) src/etmkem.c tests/speed_kem.c
	$(CC) $(CFLAGS) $(AVX2_CFLAGS) $(LDFLAGS) -DKYBER_K=4 $(AVX2_SOURCES) -lcrypto -DUSE_AVX2 src/etmkem.c tests/speed_kem.c -o $@

clean:
	rm -f tests/test_kem_512_ref.out \
		  tests/test_kem_768_ref.out \
		  tests/test_kem_1024_ref.out \
		  tests/speed_kem_512_ref.out \
		  tests/speed_kem_768_ref.out \
		  tests/speed_kem_1024_ref.out \
		  tests/test_kem_512_avx2.out \
		  tests/test_kem_768_avx2.out \
		  tests/test_kem_1024_avx2.out \
		  tests/speed_kem_512_avx2.out \
		  tests/speed_kem_768_avx2.out \
		  tests/speed_kem_1024_avx2.out
