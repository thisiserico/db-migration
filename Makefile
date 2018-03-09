.PHONY: build build-base build-postgres tag push

POSTGRES_VERSION = 9.6.4

build: build-base build-postgres

build-base:
	docker build -t db-migration:base .

build-postgres:
	docker build -t db-migration:postgres -f Dockerfile.postgres .

tag:
	docker tag db-migration:postgres quay.io/typeform/db-migration:postgres
	docker tag db-migration:postgres quay.io/typeform/db-migration:postgres-$(POSTGRES_VERSION)

push:
	docker push quay.io/typeform/db-migration:postgres
	docker push quay.io/typeform/db-migration:postgres-$(POSTGRES_VERSION)

