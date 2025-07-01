# Faster generic IND-CCA2 KEM using "encrypt-then-MAC"
This is the accompanying source code for the submission titled "Faster generic IND-CCA2 KEM using encrypt-then-MAC"

This implementation requires OpenSSL 3.x and is not compatible with OpenSSL 1.1. Make sure OpenSSL libraries are discoverable in the system path:

```bash
export OPENSSLDIR="/path/to/openssl"
export CFLAGS="-I${OPENSSLDIR}/include"
export LDFLAGS="-I${OPENSSLDIR}/lib"
```

To measure performance of individual routines run `make speed`.

To compile key exchange binaries run `make kex`. This will compile the key exchange binaries under the following options:
- KEM is ML-KEM+ or ML-KEM, with all three security levels
- if KEM is ML-KEM+, the choice of MAC can be one of:  
    - Poly1305
    - GMAC
    - CMAC
    - KMAC
- The server binary and the client binary

The compiled binaries are named in the following format:

```
kex_<etm|mlkem><512|768|1024>_[poly1305|gmac|cmac|kmac]_<server|client>
```

Where some levels of authentication is needed, a long-term keypair should be generated first with `keygen<512|768|1024>`, which will produce two files `id_kyber.bin` (secret key) and `id_kyber.pub.bin` (public key), and the public key should be distributed to the peer. **KEX binaries are currently only hard-coded to read from these file names at the current working directory.**

To run the key exchange, launch the server first, then launch the client. The second argument indicates the authentication mode:
- `none`: no authentication
- `server`: only authenticate server
- `client`: only authenticate client
- `all`: mutual authentication

```bash
make kex
./kex_server512 <none|server|client|all> <host> <port>
./kex_client512 <none|server|client|all> <host> <port>
```

# Performance data

## KEM routines

|KEM|MAC|Encap median|Encap average|Decap median|Decap average|CT size|
|:--|:--|:--|:--|:--|:--|:--|
|ML-KEM-512|Poly1305|91155|91594|32707|32874|768 + 16|
|ML-KEM-512|GMAC|94431|94784|36035|36146|768 + 16|
|ML-KEM-512|CMAC|96615|97022|38297|38451|768 + 16|
|ML-KEM-512|KMAC-256 w/ 128-bit tag|97993|98990|39649|39881|768 + 16|
|ML-KEM-512|KMAC-256 w/ 192-bit tag|98513|98864|40039|40210|768 + 24|
|ML-KEM-512|KMAC-256 w/ 256-bit tag|99371|99770|39753|39924|768 + 32|
|ML-KEM-768|Poly1305|142635|143257|41963|42268|1088 + 16|
|ML-KEM-768|GMAC|145105|145669|45109|45402|1088 + 16|
|ML-KEM-768|CMAC|148381|149130|48437|49579|1088 + 16|
|ML-KEM-768|KMAC-256 w/ 128-bit tag|150877|151582|50881|51097|1088 + 16|
|ML-KEM-768|KMAC-256 w/ 192-bit tag|150929|151766|50907|51146|1088 + 24|
|ML-KEM-768|KMAC-256 w/ 256-bit tag|151033|151760|51063|51292|1088 + 32|
|ML-KEM-1024|Poly1305|217541|218540|54521|54590|1568 + 16
|ML-KEM-1024|GMAC|220661|221404|57797|58113|1568 + 16|
|ML-KEM-1024|CMAC|225211|226226|62243|62518|1568 + 16|
|ML-KEM-1024|KMAC-256 w/ 128-bit tag|228591|229552|65701|66030|1568 + 16|
|ML-KEM-1024|KMAC-256 w/ 192-bit tag|228279|229197|65467|65784|1568 + 24|
|ML-KEM-1024|KMAC-256 w/ 256-bit tag|228357|229370|65493|65717|1568 + 32|

## Unauthenticated key exchange

|KEM|MAC|Median RTT|Average RTT|
|:--|:--|:--|:--|
|ML-KEM-512|Poly1305|95|95|
|ML-KEM-512|GMAC|98|98|
|ML-KEM-512|CMAC|100|100|
|ML-KEM-512|KMAC 128-bit tag|101|101|
|ML-KEM-512|KMAC 192-bit tag|101|101|
|ML-KEM-512|KMAC 256-bit tag|102|102|
|ML-KEM-768|Poly1305|140|140|
|ML-KEM-768|GMAC|144|144|
|ML-KEM-768|CMAC|145|146|
|ML-KEM-768|KMAC 128-bit tag|148|148|
|ML-KEM-768|KMAC 192-bit tag|147|148|
|ML-KEM-768|KMAC 256-bit tag|148|148|
|ML-KEM-1024|Poly1305|205|206|
|ML-KEM-1024|GMAC|208|208|
|ML-KEM-1024|CMAC|211|212|
|ML-KEM-1024|KMAC 128-bit tag|214|215|
|ML-KEM-1024|KMAC 192-bit tag|214|214|
|ML-KEM-1024|KMAC 256-bit tag|214|214|

## Unilaterally authentiated key exchange

|KEM|MAC|Median RTT|Average RTT|
|:--|:--|:--|:--|
|ML-KEM-512|Poly1305|144|144|
|ML-KEM-512|GMAC|149|150|
|ML-KEM-512|CMAC|154|154|
|ML-KEM-512|KMAC 128-bit tag|155|156|
|ML-KEM-512|KMAC 192-bit tag|156|157|
|ML-KEM-512|KMAC 256-bit tag|156|156|
|ML-KEM-768|Poly1305|211|212|
|ML-KEM-768|GMAC|217|217|
|ML-KEM-768|CMAC|223|224|
|ML-KEM-768|KMAC 128-bit tag|226|226|
|ML-KEM-768|KMAC 192-bit tag|226|226|
|ML-KEM-768|KMAC 256-bit tag|226|227|
|ML-KEM-1024|Poly1305|311|311|
|ML-KEM-1024|GMAC|316|317|
|ML-KEM-1024|CMAC|323|324|
|ML-KEM-1024|KMAC 128-bit tag|328|329|
|ML-KEM-1024|KMAC 192-bit tag|328|329|
|ML-KEM-1024|KMAC 256-bit tag|328|329|


## Mutually authenticated key exchange

|KEM|MAC|Median RTT|Average RTT|
|:--|:--|:--|:--|
|ML-KEM-512|Poly1305|192|192|
|ML-KEM-512|GMAC|200|200|
|ML-KEM-512|CMAC|206|206|
|ML-KEM-512|KMAC 128-bit tag|208|209|
|ML-KEM-512|KMAC 192-bit tag|209|219|
|ML-KEM-512|KMAC 256-bit tag|209|209|
|ML-KEM-768|Poly1305|281|282|
|ML-KEM-768|GMAC|290|291|
|ML-KEM-768|CMAC|298|298|
|ML-KEM-768|KMAC 128-bit tag|303|304|
|ML-KEM-768|KMAC 192-bit tag|303|304|
|ML-KEM-768|KMAC 256-bit tag|303|304|
|ML-KEM-1024|Poly1305|414|414|
|ML-KEM-1024|GMAC|423|424|
|ML-KEM-1024|CMAC|433|435|
|ML-KEM-1024|KMAC 128-bit tag|441|442|
|ML-KEM-1024|KMAC 192-bit tag|441|442|
|ML-KEM-1024|KMAC 256-bit tag|441|442|

