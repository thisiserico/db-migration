.PHONY: build build-base build-postgres

build: build-base build-postgres

build-base:
	docker build -t thisiserico/db-migration:base .

build-postgres:
	docker build -t thisiserico/db-migration:postgres -f Dockerfile.postgres .

