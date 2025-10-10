#!/bin/bash

set -e
# SQL Server connection parameters
SERVER_NAME="simple-hooks-dbs"
SQL_USERNAME="sa"
SQL_PASSWORD="sample@Strong23Password"

echo "check if setup run before ..."
value="$(sqlcmd -S "$SERVER_NAME" -U "$SQL_USERNAME" -P "$SQL_PASSWORD" -C  -b -r1 -h -1 -W -Q "set nocount on; select count(*) from master.sys.databases where name = 'sampledb';")"

echo "value: $value"

# check if more than 4 databases exist
if [ "$value" -gt 0 ]; then
    echo "Setup has been run before. Exiting."
    exit 0
fi

echo "fresh new setup."