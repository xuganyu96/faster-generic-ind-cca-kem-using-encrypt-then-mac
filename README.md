# PQQS '26: Faster generic CCA secure KEM transformation using encrypt-then-MAC

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
