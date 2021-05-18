compose-setup: env-prepare compose-build compose-install

compose-build:
	docker-compose build

compose-install:
	docker-compose run app make install

compose-bash:
	docker-compose run app bash

compose-lint:
	docker-compose run app make lint

compose-lint-ci:
	docker-compose -f docker-compose.yml run app make lint

compose-test:
	docker-compose run app make test

compose-test-ci:
	docker-compose -f docker-compose.yml run app make test

compose:
	docker-compose up --abort-on-container-exit

compose-down:
	docker-compose down -v --remove-orphans

compose-push:
	docker-compose -f docker-compose.yml push app

setup: env-prepare install

install:
	npm ci

start:
	npm start

lint:
	npx eslint .

test:
	npm test

env-prepare:
	cp -n .env.example .env || true
