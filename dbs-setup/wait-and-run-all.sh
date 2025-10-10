#!/bin/bash

# exit on error
set -e

export PATH=$PATH:/opt/mssql-tools/bin

cd dbs-setup

# check if setup run before ...
./check-setup-run-before.sh

# create SimpleIdentityServerSecurityLogs db
./execute-identity-server-log-sql.sh

# create simple hooks dbs
cd simplehooks-db
./execute-operation-schema-data-sql.sh
cd ..

cd log-db
./execute-log-schema-data-sql.sh
cd ..

# create sample listener sampledb
cd sample-listener-db
./execute-sample-db-schema-sql.sh
cd ..

touch completed
