/**
 * @package   ed25519-to-x25519.wasm
 * @author    Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @copyright Copyright (c) 2017, Nazar Mokrynskyi
 * @license   MIT License, see license.txt
 */
#include "crypto_core/curve25519/ref10/curve25519_ref10.c"
#include "crypto_hash/sha512/cp/hash_sha512_cp.c"
#include "sodium/utils.c"
#include "crypto_verify/sodium/verify.c"
#include "crypto_sign/ed25519/ref10/open.c"
#include "crypto_sign/ed25519/ref10/keypair.c"
