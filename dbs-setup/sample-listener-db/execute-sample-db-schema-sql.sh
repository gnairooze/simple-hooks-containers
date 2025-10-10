#!/bin/bash

# SQL Server connection parameters
SERVER_NAME="simple-hooks-dbs"
SQL_USERNAME="sa"
SQL_PASSWORD="sample@Strong23Password"

echo "creating sample db ..."
sqlcmd -S "$SERVER_NAME" -i "create-db-schema.sql" -U "$SQL_USERNAME" -P "$SQL_PASSWORD" -C

echo "All SQL files have been executed." 