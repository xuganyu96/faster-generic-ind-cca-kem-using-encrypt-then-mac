# PQQS '26: Faster generic CCA secure KEM transformation using encrypt-then-MAC

Please implement a speed test for the various KEM routines declared in `include/pqqs26/pqqs26.h`.
The source file should be placed under `tests/speed_kem.c`.

The speed test should measure the duration of `keypair`, `enc`, and `dec` routines.
The unit of duration depends on the platform and operating systems:

- On `__x86_64__`, use RDTSCP or RDTSC, whichever is more appropriate for benchmarking
- On `__APPLE__`, use the most precise monotonic system clock
- On 64-bit ARM, use the appropriate inline assembly to read CPU counter
- Fall back to a portalbe high-precision system clock if everything else fails

Use inline assembly and appropriate memory/load fences to ensure in-order execution
and prevent compiler optimization as much as possible.

The speed test should run each routine a number of times per epoch. The program
should print to `stdout` a CSV-format output where each row contains the name
of the routine, an epoch counter (starting at 0), the number of rounds in this
epoch, the duration, and the unit of duration (RDTSC, mach/time, etc.).

Add `speed_kem.c` to `Makefile` in three targets `tests/speed_kem_<512|768|1024>.out`
each compiled with `-DKYBER_K=2,3,4` respectively.

Finally, write a Python script under `scripts/speed.py` that reads the output of
`speed_kem` and print a human-readable report that contains some statistical
results including medium and standard deviation.

## Git submodules

This project uses `pq-crystals/kyber@3edd5af` as a sub-module. After cloning
this repository, initialize the sub-modules with `git submodule update` command:

```bash
# Adding sub-module
git submodule add git@github.com:pq-crystals/kyber.git pqcrystals-kyber
cd pqcrystals-kyber
git checkout 3edd5af5991927164edd4aacebfcbee00b8064e7
cd ..
git add .gitmodules pqcrystals-kyber

# Initializing sub-module on cloning
git submodule update --init --recursive
```
