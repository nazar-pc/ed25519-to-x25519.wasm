/**
 * @package ed25519-to-x25519.wasm
 * @author  Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @license 0BSD
 */
#include "crypto_core/ed25519/ref10/ed25519_ref10.c"
#include "crypto_hash/sha512/cp/hash_sha512_cp.c"
#include "sodium/utils.c"
#include "crypto_verify/sodium/verify.c"
#include "crypto_sign/ed25519/ref10/open.c"
#include "crypto_sign/ed25519/ref10/keypair.c"
