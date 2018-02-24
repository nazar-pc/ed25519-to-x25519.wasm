/**
 * @package ed25519-to-x25519.wasm
 * @author  Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @license 0BSD
 */
exec	= require('child_process').exec
glob	= require('glob')
gulp	= require('gulp')
rename	= require('gulp-rename')
uglify	= require('gulp-uglify')

gulp
	.task('build', ['wasm', 'minify'])
	.task('wasm', (callback) !->
		functions	= JSON.stringify([
			'_malloc'
			'_free'
			'_crypto_sign_ed25519_pk_to_curve25519'
			'_crypto_sign_ed25519_sk_to_curve25519'
		])
		# Options that are only specified to optimize resulting file size and basically remove unused features
		optimize	= "-Oz --llvm-lto 1 --closure 1 -s NO_EXIT_RUNTIME=1 -s NO_FILESYSTEM=1 -s EXPORTED_RUNTIME_METHODS=[] -s DEFAULT_LIBRARY_FUNCS_TO_INCLUDE=[]"
		clang_opts	= "-I vendor/src/libsodium -I vendor/src/libsodium/include/sodium"
		command		= "EMMAKEN_CFLAGS='#clang_opts' emcc src/ed25519-to-x25519.c --post-js src/bytes_allocation.js -o src/ed25519-to-x25519.js -s MODULARIZE=1 -s 'EXPORT_NAME=\"__ed25519_to_x25519_wasm\"' -s EXPORTED_FUNCTIONS='#functions' -s WASM=1 #optimize"
		exec(command, (error, stdout, stderr) !->
			if stdout
				console.log(stdout)
			if stderr
				console.error(stderr)
			callback(error)
		)
	)
	.task('minify', ->
		gulp.src("src/index.js")
			.pipe(uglify())
			.pipe(rename(
				suffix: '.min'
			))
			.pipe(gulp.dest('src'))
	)
