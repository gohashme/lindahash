run:
	# crystal run ./src/lindahash.cr
	./sentry

run-ssl:
	./lindahash --ssl --ssl-key-file dev_ssl/server.key --ssl-cert-file dev_ssl/server.crt

build:
	crystal build ./src/lindahash.cr

build-release:
	crystal build --stats --progress --release --verbose -o gohashme ./src/lindahash.cr

stop-screen:
	killall screen

run-release:
	screen -d -m ./gohashme --ssl --ssl-key-file /etc/letsencrypt/live/gohashme.com/privkey.pem --ssl-cert-file /etc/letsencrypt/live/gohashme.com/fullchain.pem

restart:
	make stop-screen
	make build-release
	make run-release