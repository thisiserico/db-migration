-- +migrate Up

CREATE TABLE example (
    id         VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP    NOT NULL
);

-- +migrate Down
DROP TABLE example;

