/**
 * @package   ed25519-to-x25519.wasm
 * @author    Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @copyright Copyright (c) 2017, Nazar Mokrynskyi
 * @license   MIT License, see license.txt
 */
lib	= require('../ed25519-to-x25519')()

module.exports = {ready : lib.then, convert_public_key, convert_private_key}

allocate	= lib.allocateBytes

/**
 * @param {!Uint8Array} ed25519_public_key
 *
 * @return {Uint8Array} `null` if conversion failed
 */
function convert_public_key (ed25519_public_key)
	x25519_public_key	= allocate(32)
	ed25519_public_key	= allocate(0, ed25519_public_key)
	result				= lib._crypto_sign_ed25519_pk_to_curve25519(x25519_public_key, ed25519_public_key)
	if result != 0
		return null
	x25519_public_key	= x25519_public_key.get()
	lib.freeBytes()
	x25519_public_key
/**
 * @param {!Uint8Array} ed25519_private_key
 *
 * @return {!Uint8Array} `null` if conversion failed
 */
function convert_private_key (ed25519_private_key)
	x25519_private_key	= allocate(32)
	ed25519_private_key	= allocate(0, ed25519_private_key)
	lib._crypto_sign_ed25519_sk_to_curve25519(x25519_private_key, ed25519_private_key)
	x25519_private_key	= x25519_private_key.get()
	lib.freeBytes()
	x25519_private_key
