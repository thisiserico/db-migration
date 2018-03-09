# db-migration
[![Build Status](https://travis-ci.org/Typeform/db-migration.svg?branch=master)](https://travis-ci.org/Typeform/db-migration) [![Docker Container](https://quay.io/repository/typeform/db-migration/status "Docker Repository on Quay")](https://quay.io/repository/typeform/db-migration)

[`quay.io/typeform/db-migration`][db-migration] wraps [`sql-migrate`][sql-migrate] within docker to easily run your containerized migrations.

## Containerize your migrations

You'll need a directory with two elements:

- A `sql` folder with all the sql migration files (check out the examples!)
```
sql
├── 00_setup.sql
└── 01_tables_creation.sql
```

- A `Dockerfile` with just a couple lines
```
FROM quay.io/typeform/db-migration:postgres-9.6.4
COPY . .
```

After that, build the image and run a container:
```
docker build -t my-migrations .
docker run my-migrations up
```

[db-migration]: https://quay.io/repository/typeform/db-migration
[sql-migrate]: https://github.com/rubenv/sql-migrate

