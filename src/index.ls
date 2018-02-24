/**
 * @package ed25519-to-x25519.wasm
 * @author  Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @license 0BSD
 */
function Wrapper (lib)
	lib			= lib()
	allocate	= lib['allocateBytes']
	free		= lib['freeBytes']

	/**
	 * @param {!Uint8Array} ed25519_public_key
	 *
	 * @return {Uint8Array} `null` if conversion failed
	 */
	function convert_public_key (ed25519_public_key)
		x25519_public_key	= allocate(32)
		ed25519_public_key	= allocate(0, ed25519_public_key)
		result				= lib['_crypto_sign_ed25519_pk_to_curve25519'](x25519_public_key, ed25519_public_key)
		if result != 0
			return null
		x25519_public_key	= x25519_public_key.get()
		free()
		x25519_public_key
	/**
	 * @param {!Uint8Array} ed25519_private_key
	 *
	 * @return {!Uint8Array}
	 */
	function convert_private_key (ed25519_private_key)
		x25519_private_key	= allocate(32)
		ed25519_private_key	= allocate(0, ed25519_private_key)
		lib['_crypto_sign_ed25519_sk_to_curve25519'](x25519_private_key, ed25519_private_key)
		x25519_private_key	= x25519_private_key.get()
		free()
		x25519_private_key

	{
		'ready'					: lib.then
		'convert_public_key'	: convert_public_key
		'convert_private_key'	: convert_private_key
	}

if typeof define == 'function' && define['amd']
	# AMD
	define(['./ed25519-to-x25519'], Wrapper)
else if typeof exports == 'object'
	# CommonJS
	module.exports = Wrapper(require('./ed25519-to-x25519'))
else
	# Browser globals
	@'ed25519_to_x25519_wasm' = Wrapper(@'__ed25519_to_x25519_wasm')
