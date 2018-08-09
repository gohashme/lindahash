run:
	./sentry

run-ssl:
	./lindahash --ssl --ssl-key-file dev_ssl/server.key --ssl-cert-file dev_ssl/server.crt

build:
	crystal build ./src/lindahash.cr

shards:
	shards install

install: shards rebuild-sentry

build-release:
	crystal build --stats --progress --release --verbose -o gohashme ./src/lindahash.cr

stop-screen:
	killall screen

run-release:
	screen -d -m ./gohashme --ssl --ssl-key-file /etc/letsencrypt/live/gohashme.com/privkey.pem --ssl-cert-file /etc/letsencrypt/live/gohashme.com/fullchain.pem

restart:
	make build-release
	make stop-screen
	make run-release

rebuild-sentry:
	curl -fsSLo- https://raw.githubusercontent.com/samueleaton/sentry/master/install.cr | crystal eval