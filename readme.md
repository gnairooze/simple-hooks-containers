# simple-hooks

Simple-Hooks is a solution to empower your app with events, and let other APIs to subscribe to various events.
It posts the event data to every subscribed API.

All you have to do in your app is to trigger the event you want, by calling Simple-Hooks API.

Simple-Hooks will call all the subscribers, with the event data and retry on them in case of failure.

you can find the source code in the [SimpleHooks](https://github.com/gnairooze/SimpleHooks) repository.

## Getting Started

use one of the following docker-compose files to run the solution.

### docker-compose.yml

the docker-compose.yml file contains the following services:

1. simple-hooks-web-1: anonymous simple-hooks web api
2. simple-hooks-authapi-1: authenticated simple-hooks web api
3. simple-hooks-processor-1: simple-hooks server processor
4. identity-api-instance-1: identity server api using openiddict
5. simple-hooks-sample-listener-1: a sample listener api to test the solution
6. simple-hooks-dbs: a sql server instance for simple-hooks, sample listener and identity server databases.
7. simple-hooks-dbs-setup: a one-time setup container to create the databases and initial data. after that, it will exit.
8. simple-hooks-identity-config: a one-time setup container to configure the identity server for simple-hooks. after that, it will exit.

run the following command in the directory containing the docker-compose.yml file:

```bash
docker-compose up -d
```

it will take at least 40 seconds to run the containers for the first time.

### docker-compose-without-sql.yml

#### Prerequisites

- this image depends on SQL server, details of the databases can be found in [dbs-setup readme](https://github.com/gnairooze/simple-hooks-containers/blob/main/dbs-setup/readme.md).

- the identity server should be configured for simple-hooks. details of the configuration can be found in [dbs-setup readme](https://github.com/gnairooze/simple-hooks-containers/blob/main/dbs-setup/readme.md). also

#### using docker compose

docker-compose-without-sql.yml file contains 5 services:

1. simple-hooks-web-1: anonymous simple-hooks web api
2. simple-hooks-authapi-1: authenticated simple-hooks web api
3. simple-hooks-processor-1: simple-hooks server processor
4. identity-api-instance-1: identity server api using openiddict
5. simple-hooks-sample-listener-1: a sample listener api to test the solution

all the services needs sql server databases.
run the following command in the directory containing the docker-compose-without-sql.yml file:

```bash
docker-compose -f docker-compose-without-sql.yml up -d
```

## simple-hooks endpoints

add the following line to your hosts file:

```hosts
127.0.0.1 identity.dev.test
```

after the containers are running, you can access the following endpoints:

### anonymous simple-hooks web api

- http://localhost:8051/api/TriggerEvent: trigger an event.

- http://localhost:8051/api/eventinstance/get-status?businessid={{event-instance-business-id}}: read the status of an event instance.

- http://localhost:8051/api/definitions/load-definitions: load the definitions.

### authenticated simple-hooks web api

- https://identity.dev.test:8071/connect/token: get token from identity server api.

- http://localhost:8052/api/TriggerEvent: trigger an event using the token.

- http://localhost:8052/api/eventinstance/get-status?businessid={{event-instance-business-id}}: read the status of an event instance using the token.

- http://localhost:8052/api/definitions/load-definitions: load the definitions using the token.

### sample listener api

- http://localhost:5011/api/sample: post event data to sample listener api.

### identity server api

- https://identity.dev.test:8071/connect/token: get token from identity server api.

- http://localhost:8071/connect/userinfo: identity server api userinfo endpoint

- https://identity.dev.test:8071/connect/introspect: identity server api introspect endpoint

- https://identity.dev.test:8071/.well-known/openid-configuration: identity server api openid configuration endpoint

- https://identity.dev.test:8071/.well-known/jwks: identity server api jwks endpoint
