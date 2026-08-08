# PQQS '26: Faster generic CCA secure KEM transformation using encrypt-then-MAC

## Getting started

Where AVX2 is not supported:

```bash
make ref

./tests/test_kem_512_ref.out
./tests/test_kem_768_ref.out
./tests/test_kem_1024_ref.out
./tests/speed_kem_512_ref.out 10 1000 | ./scripts/speed.py
./tests/speed_kem_768_ref.out 10 1000 | ./scripts/speed.py
./tests/speed_kem_1024_ref.out 10 1000 | ./scripts/speed.py
```

Where AVX2 is supported, you can build with Kyber's AVX2 backend.

```bash
make avx2

./tests/test_kem_512_avx2.out
./tests/test_kem_768_avx2.out
./tests/test_kem_1024_avx2.out
./tests/speed_kem_512_avx2.out 10 1000 | ./scripts/speed.py
./tests/speed_kem_768_avx2.out 10 1000 | ./scripts/speed.py
./tests/speed_kem_1024_avx2.out 10 1000 | ./scripts/speed.py
```

## Benchmark

```
OS: Fedora Linux 43 (Workstation Edition) x86_64
Kernel: Linux 7.0.8-100.fc43.x86_64
Packages: 2184 (rpm)
Shell: bash 5.3.0
CPU: Intel(R) Core(TM) i5-10500T (12) @ 3.80 GHz
Memory: 3.98 GiB / 15.31 GiB (26%)
Locale: en_US.UTF-8
CC: gcc version 15.3.1 20260722 (Red Hat 15.3.1-1) (GCC) 
```

### With `ref` backend

| parameter | routine       | unit   | samples |    median |      mean |  stddev |       min |       max |
| :-------- | :------------ | :----- | ------: | --------: | --------: | ------: | --------: | --------: |
| Kyber512  | kyber/keypair | RDTSCP |      10 |  77929.43 |  78929.01 | 2504.83 |  77556.66 |  85663.70 |
| Kyber512  | kyber/enc     | RDTSCP |      10 |  90766.59 |  92586.33 | 3653.44 |  90307.00 |  99802.59 |
| Kyber512  | etm/enc       | RDTSCP |      10 |  94848.04 |  95693.42 | 1577.26 |  94604.90 |  98520.04 |
| Kyber512  | tch/enc       | RDTSCP |      10 |  92305.88 |  92618.23 |  896.11 |  91864.19 |  94464.45 |
| Kyber512  | kyber/dec     | RDTSCP |      10 | 118988.70 | 120392.74 | 2543.75 | 118324.75 | 124873.96 |
| Kyber512  | etm/dec       | RDTSCP |      10 |  30448.38 |  30620.71 |  336.10 |  30396.21 |  31272.61 |
| Kyber512  | tch/dec       | RDTSCP |      10 |  34501.07 |  34527.33 |  104.19 |  34419.55 |  34772.86 |
| Kyber768  | kyber/keypair | RDTSCP |      10 | 132186.59 | 133944.40 | 3750.68 | 131510.42 | 143562.93 |
| Kyber768  | kyber/enc     | RDTSCP |      10 | 147873.49 | 148685.94 | 2033.29 | 147232.76 | 153048.01 |
| Kyber768  | etm/enc       | RDTSCP |      10 | 152217.54 | 153278.11 | 3046.83 | 151570.57 | 161648.31 |
| Kyber768  | tch/enc       | RDTSCP |      10 | 149600.61 | 149930.86 | 1125.38 | 148936.17 | 152883.65 |
| Kyber768  | kyber/dec     | RDTSCP |      10 | 185393.65 | 186000.20 | 1859.44 | 184671.18 | 191060.33 |
| Kyber768  | etm/dec       | RDTSCP |      10 |  39423.76 |  39535.67 |  394.77 |  39353.57 |  40655.17 |
| Kyber768  | tch/dec       | RDTSCP |      10 |  46427.97 |  46810.86 |  936.81 |  46126.83 |  49157.11 |
| Kyber1024 | kyber/keypair | RDTSCP |      10 | 205065.08 | 207201.71 | 4806.66 | 204176.61 | 219070.75 |
| Kyber1024 | kyber/enc     | RDTSCP |      10 | 217330.99 | 219287.53 | 4964.04 | 215655.05 | 231086.46 |
| Kyber1024 | etm/enc       | RDTSCP |      10 | 222399.69 | 222288.30 | 1436.57 | 220436.97 | 224508.68 |
| Kyber1024 | tch/enc       | RDTSCP |      10 | 219158.94 | 219733.47 | 2549.54 | 217501.88 | 226352.25 |
| Kyber1024 | kyber/dec     | RDTSCP |      10 | 264499.56 | 265686.28 | 3220.83 | 262571.36 | 271760.30 |
| Kyber1024 | etm/dec       | RDTSCP |      10 |  48825.99 |  49291.78 |  992.39 |  48739.77 |  51735.32 |
| Kyber1024 | tch/dec       | RDTSCP |      10 |  58652.95 |  58845.68 |  510.07 |  58602.97 |  60271.48 |

### With `avx2` backend

| parameter | routine       | unit   | samples |   median |     mean |  stddev |      min |      max |
| :-------- | :------------ | :----- | ------: | -------: | -------: | ------: | -------: | -------: |
| Kyber512  | kyber/keypair | RDTSCP |      10 | 16351.11 | 16214.41 |  619.75 | 15544.29 | 17356.64 |
| Kyber512  | kyber/enc     | RDTSCP |      10 | 17285.23 | 17156.09 |  566.34 | 16493.03 | 18133.72 |
| Kyber512  | etm/enc       | RDTSCP |      10 | 20099.54 | 20549.31 |  687.63 | 19977.13 | 21766.54 |
| Kyber512  | tch/enc       | RDTSCP |      10 | 18484.54 | 18530.17 |  626.71 | 17897.21 | 19346.59 |
| Kyber512  | kyber/dec     | RDTSCP |      10 | 18329.02 | 18295.42 |  523.28 | 17699.41 | 18989.70 |
| Kyber512  | etm/dec       | RDTSCP |      10 |  3616.99 |  3624.95 |  135.96 |  3476.33 |  3861.80 |
| Kyber512  | tch/dec       | RDTSCP |      10 |  6773.93 |  6761.79 |  201.97 |  6558.23 |  7017.89 |
| Kyber768  | kyber/keypair | RDTSCP |      10 | 26696.20 | 27042.90 | 1054.77 | 25963.51 | 29162.35 |
| Kyber768  | kyber/enc     | RDTSCP |      10 | 26958.60 | 27184.93 | 1619.64 | 25680.40 | 31343.22 |
| Kyber768  | etm/enc       | RDTSCP |      10 | 30512.57 | 30653.49 | 1419.84 | 29078.46 | 34091.38 |
| Kyber768  | tch/enc       | RDTSCP |      10 | 27869.21 | 28062.64 | 1107.28 | 26825.55 | 30618.70 |
| Kyber768  | kyber/dec     | RDTSCP |      10 | 29057.09 | 29066.17 | 1406.72 | 27545.25 | 32293.96 |
| Kyber768  | etm/dec       | RDTSCP |      10 |  4008.81 |  4002.83 |  137.38 |  3835.18 |  4232.44 |
| Kyber768  | tch/dec       | RDTSCP |      10 |  9291.17 |  9392.25 |  352.92 |  9044.36 | 10205.67 |
| Kyber1024 | kyber/keypair | RDTSCP |      10 | 36447.22 | 36864.22 | 1211.84 | 35847.28 | 39276.58 |
| Kyber1024 | kyber/enc     | RDTSCP |      10 | 37253.06 | 37440.41 | 1271.81 | 36286.18 | 40503.84 |
| Kyber1024 | etm/enc       | RDTSCP |      10 | 41098.50 | 41249.09 | 1191.62 | 40240.15 | 44289.91 |
| Kyber1024 | tch/enc       | RDTSCP |      10 | 38619.76 | 38887.99 | 1023.90 | 37998.94 | 40991.18 |
| Kyber1024 | kyber/dec     | RDTSCP |      10 | 40241.40 | 40557.06 | 1200.67 | 39387.97 | 42891.36 |
| Kyber1024 | etm/dec       | RDTSCP |      10 |  4287.99 |  4369.29 |  135.44 |  4275.08 |  4691.33 |
| Kyber1024 | tch/dec       | RDTSCP |      10 | 11919.49 | 12112.02 |  344.98 | 11868.39 | 12873.55 |
