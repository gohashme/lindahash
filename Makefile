run:
	# crystal run ./src/lindahash.cr
	./sentry

run-ssl:
	./lindahash --ssl --ssl-key-file dev_ssl/server.key --ssl-cert-file dev_ssl/server.crt

build:
	crystal build ./src/lindahash.cr

build-release:
	crystal build --stats --progress --release --static --verbose -o gohashme ./src/lindahash.cr