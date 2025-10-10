#!/bin/bash

cd simple-identity-server-cli

# add the simplehooks api scopes
./SimpleIdentityServer.CLI scope add --name "simplehooks_api" --display-name "resource simple hooks api" --resources "simplehooks_api"

./SimpleIdentityServer.CLI scope add --name "simplehooks_api.trigger_event" --display-name "trigger event to simple hooks api" --resources "simplehooks_api"

./SimpleIdentityServer.CLI scope add --name "simplehooks_api.load_definitions" --display-name "load definitions from simple hooks api" --resources "simplehooks_api"

./SimpleIdentityServer.CLI scope add --name "simplehooks_api.get_event_instance_status" --display-name "get event instance status from simple hooks api" --resources "simplehooks_api"

# add the simplehooks api client
./SimpleIdentityServer.CLI app add --client-id "simplehooks_api" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks auth api" --permissions "ept:introspection"

# add client application to trigger events
./SimpleIdentityServer.CLI app add --client-id "postman-client-trigger-event" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks api postman client to trigger event" --permissions "ept:token" --permissions "ept:introspection" --permissions "gt:client_credentials" --permissions "scp:simplehooks_api.trigger_event"

# add client to check status
./SimpleIdentityServer.CLI app add --client-id "postman-client-check-status" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks api postman client to check status" --permissions "ept:token" --permissions "ept:introspection" --permissions "gt:client_credentials" --permissions "scp:simplehooks_api.get_event_instance_status"

# add client to load definitions
./SimpleIdentityServer.CLI app add --client-id "postman-client-load-defs" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks api postman client to load definitions" --permissions "ept:token" --permissions "ept:introspection" --permissions "gt:client_credentials" --permissions "scp:simplehooks_api.load_definitions"

# add support client have all permissions
./SimpleIdentityServer.CLI app add --client-id "postman-client-admin" --client-secret "P@ssw0rdP@ssw0rd" --display-name "simple-hooks api postman client admin" --permissions "ept:token" --permissions "ept:introspection" --permissions "gt:client_credentials" --permissions "scp:simplehooks_api.trigger_event" --permissions "scp:simplehooks_api.load_definitions" --permissions "scp:simplehooks_api.get_event_instance_status"

cd ..
