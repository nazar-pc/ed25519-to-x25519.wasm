/**
 * @package ed25519-to-x25519.wasm
 * @author  Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @license 0BSD
 */
lib		= require('..')
test	= require('tape')

ed25519_public			= Buffer.from('8fbe438aab6c40dc2ebc839ba27530ca1bf23d4efd36958a3365406efe52ccd1', 'hex')
ed25519_private			= Buffer.from('28e9e1d48cb0e52e437080e4a180058d7a42a07abcd05ea2ec4e6122cded8f6a0d2a6b9fd1878fd76ab20caecab666916ac3cc772fc57f8fa6e8dc3227bb8497', 'hex')
expected_x25519_public	= Buffer.from('26100e941bdd2103038d8dec9a1884694736f591ee814e66ae6e2e2284757136', 'hex')
expected_x25519_private	= Buffer.from('803fcdab44e9958d2f8e4d47b5f0d481d6ddb79dd462a18ee65cabe94a9e455c', 'hex')

<-! lib.ready
test('Keypair conversion', (t) !->
	t.plan(2)

	x25519_public	= lib.convert_public_key(ed25519_public)
	x25519_private	= lib.convert_private_key(ed25519_private)

	t.equal(x25519_public.join(','), expected_x25519_public.join(','), 'Public key converted correctly')
	t.equal(x25519_private.join(','), expected_x25519_private.join(','), 'Private key converted correctly')
)

