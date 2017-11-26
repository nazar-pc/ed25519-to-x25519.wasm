# ed25519-to-x25519.wasm
Library for converting Ed25519 signing key pair into X25519/Curve25519 key pair suitable for Diffie-Hellman key exchange.

Based on [libsodium](https://github.com/jedisct1/libsodium), compiles subset of libsodium to WebAssembly and provides 2 wrapper functions for public/private keys conversion.

## How to install
```
npm install ed25519-to-x25519.wasm
```

## How to use
NOTE: In modern versions of Node.js (4.x and higher) `Buffer` inherits `Uint8Array`, so you can pass `Buffer` directly whenever `Uint8Array` is expected.

Node.js:
```javascript
var ed25519_to_x25519 = require('ed25519-to-x25519.wasm')

ed25519_to_x25519.ready(function () {
    // Do stuff
});
```
Browser:
```javascript
requirejs(['ed25519-to-x25519.wasm'], function (ed25519_to_x25519) {
    ed25519_to_x25519.ready(function () {
        // Do stuff
    });
})
```

# API
### ed25519_to_x25519.ready(callback)
* `callback` - Callback function that is called when WebAssembly is loaded and library is ready for use

### ed25519_to_x25519.convert_public_key(ed25519_public_key : Uint8Array) : Uint8Array
Converts Ed25519 public key into X25519/Curve25519 public key. Returns `null` if conversion fails.

### ed25519_to_x25519.convert_private_key(ed25519_private_key : Uint8Array) : Uint8Array
Converts Ed25519 private key into X25519/Curve25519 private key.

Take a look at `src/index.ls` for JsDoc sections with arguments and return types as well as methods description, look at `tests/index.ls` for usage examples.

## Contribution
Feel free to create issues and send pull requests (for big changes create an issue first and link it from the PR), they are highly appreciated!

When reading LiveScript code make sure to configure 1 tab to be 4 spaces (GitHub uses 8 by default), otherwise code might be hard to read.

## License
MIT, see license.txt
