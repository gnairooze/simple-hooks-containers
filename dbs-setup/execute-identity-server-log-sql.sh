#!/bin/bash

# SQL Server connection parameters
SERVER_NAME="simple-hooks-dbs"
SQL_USERNAME="sa"
SQL_PASSWORD="sample@Strong23Password"

echo "creating SimpleIdentityServerSecurityLogs db ..."
sqlcmd -S "$SERVER_NAME" -U "$SQL_USERNAME" -P "$SQL_PASSWORD" -C -Q "create database SimpleIdentityServerSecurityLogs"

echo "SimpleIdentityServerSecurityLogs db created."