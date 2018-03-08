#!/bin/sh

if [ "$#" = "0" ]; then
  echo "A command is required, it can be either up or down."
  exit
fi

jq -n -f dbconfig.jq \
    --arg DIALECT $DIALECT \
	--arg DSN \
	"sslmode=disable \
    host=$DB_HOST \
	user=$DB_USER \
	dbname=$DB_NAME \
	password=$DB_PASS \
	" > dbconfig.yml

sql-migrate $@

