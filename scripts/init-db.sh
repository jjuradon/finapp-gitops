#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- auth_household
    CREATE USER finapp_auth WITH PASSWORD 'secret';
    CREATE SCHEMA auth_household;
    GRANT USAGE, CREATE ON SCHEMA auth_household TO finapp_auth;

    -- account
    CREATE USER finapp_account WITH PASSWORD 'secret';
    CREATE SCHEMA account;
    GRANT USAGE, CREATE ON SCHEMA account TO finapp_account;

    -- transaction
    CREATE USER finapp_transaction WITH PASSWORD 'secret';
    CREATE SCHEMA transaction;
    GRANT USAGE, CREATE ON SCHEMA transaction TO finapp_transaction;

    -- planning
    CREATE USER finapp_planning WITH PASSWORD 'secret';
    CREATE SCHEMA planning;
    GRANT USAGE, CREATE ON SCHEMA planning TO finapp_planning;

    -- categorisation
    CREATE USER finapp_categorisation WITH PASSWORD 'secret';
    CREATE SCHEMA categorisation;
    GRANT USAGE, CREATE ON SCHEMA categorisation TO finapp_categorisation;

    -- analytics
    CREATE USER finapp_analytics WITH PASSWORD 'secret';
    CREATE SCHEMA analytics;
    GRANT USAGE, CREATE ON SCHEMA analytics TO finapp_analytics;
EOSQL
