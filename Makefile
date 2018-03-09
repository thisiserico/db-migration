.PHONY: build build-base build-postgres tag push

POSTGRES_VERSION = 9.6.4

build: build-base build-postgres

build-base:
	docker build -t thisiserico/db-migration:base .

build-postgres:
	docker build -t thisiserico/db-migration:postgres -f Dockerfile.postgres .

tag:
	docker tag thisiserico/db-migration:postgres thisiserico/db-migration:postgres-$(POSTGRES_VERSION)

push:
	docker push thisiserico/db-migration:postgres
	docker push thisiserico/db-migration:postgres-$(POSTGRES_VERSION)

