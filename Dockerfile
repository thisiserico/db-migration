FROM golang:1.10.0-alpine as builder

RUN apk add --update git build-base bash

RUN go get github.com/rubenv/sql-migrate/...


FROM alpine

RUN apk add --update jq
COPY --from=builder /go/bin/sql-migrate /bin/sql-migrate

COPY . .

ENTRYPOINT ["./entrypoint.sh"]

