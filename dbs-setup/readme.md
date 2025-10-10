# setup dbs for simple-hooks

## simple-identity-server:0.5 dbs

### SimpleIdentityServer

created automatically by identity server api on first run.

### SimpleIdentityServerSecurityLogs

create the database using the following sql script:

```sql
create database SimpleIdentityServerSecurityLogs;
```

tables will be created automatically by identity server api on first run.

### simple hooks scopes and applications' clients

1. add the simplehooks api scopes

  ```sh
  ./SimpleIdentityServer.CLI.exe scope add --name "simplehooks_api" --display-name "resource simple hooks api" --resources "simplehooks_api"

  ./SimpleIdentityServer.CLI.exe scope add --name "simplehooks_api.trigger_event" --display-name "trigger event to simple hooks api" --resources "simplehooks_api"

  ./SimpleIdentityServer.CLI.exe scope add --name "simplehooks_api.load_definitions" --display-name "load definitions from simple hooks api" --resources "simplehooks_api"

  ./SimpleIdentityServer.CLI.exe scope add --name "simplehooks_api.get_event_instance_status" --display-name "get event instance status from simple hooks api" --resources "simplehooks_api"
  ```

2. simplehooks api to call introspect endpoint to validate the token when called by client applications that passes their tokens.the simplehooks api client_id must be exactly the same as the resource in the scope definition.

  ```sh
  ./SimpleIdentityServer.CLI.exe app add --client-id "simplehooks_api" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks auth api" --permissions "ept:introspection"
  ```

3. client application to trigger events

  ```sh
  ./SimpleIdentityServer.CLI.exe app add --client-id "postman-client-trigger-event" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks api postman client to trigger event" --permissions "ept:token" --permissions "ept:introspection" --permissions "gt:client_credentials" --permissions "scp:simplehooks_api.trigger_event"
  ```

4. client to check status

  ```sh
  ./SimpleIdentityServer.CLI.exe app add --client-id "postman-client-check-status" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks api postman client to check status" --permissions "ept:token" --permissions "ept:introspection" --permissions "gt:client_credentials" --permissions "scp:simplehooks_api.get_event_instance_status"
  ```

5. client to load definitions - mostly support admin

  ```sh
  ./SimpleIdentityServer.CLI.exe app add --client-id "postman-client-load-defs" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks api postman client to load definitions" --permissions "ept:token" --permissions "ept:introspection" --permissions "gt:client_credentials" --permissions "scp:simplehooks_api.load_definitions"
  ```

6. support client have all permissions for testing

  ```sh
  ./SimpleIdentityServer.CLI.exe app add --client-id "postman-client-admin" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks api postman client admin" --permissions "ept:token" --permissions "ept:introspection" --permissions "gt:client_credentials" --permissions "scp:simplehooks_api.trigger_event" --permissions "scp:simplehooks_api.load_definitions" --permissions "scp:simplehooks_api.get_event_instance_status"
  ```

## simple-hooks dbs

the following will describe the databases needed for simple-hooks:web-2.8.2, simple-hooks:authapi-2.8.2, simple-hooks:proc-2.8.2

### simplehooks

create the database using the following sql script:

```sql
create database simplehooks;
```

execute script `dbs-setup/simplehooks-db/execute-operation-schema-data-sql.sh` to create the tables, stored procedures and insert initial data.

### SimpleHooks_Log_DB

create the database using the following sql script:

```sql
create database SimpleHooks_Log_DB;
```

execute script `dbs-setup/log-db/execute-log-schema-data-sql.sh` to create the tables, stored procedures and insert initial data.

## simple-hooks:listener-1.0 db

create the database and a table using the following sql script:

```sql
create database sampledb;
go

create table [dbo].[SampleModels](
	[Id] [bigint] IDENTITY(1,1) not null,
	[EventName] [nvarchar](max) not null,
	[CorrelationId] [nvarchar](50) not null,
	[EventData] [nvarchar](max) not null,
	[CreatedDate] [datetime2](7) not null,
 constraint [PK_SampleModels] primary key clustered 
(
	[Id] asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, OPTIMIZE_FOR_SEQUENTIAL_KEY = off) on [PRIMARY]
) on [PRIMARY] textimage_on [PRIMARY];
go
```
