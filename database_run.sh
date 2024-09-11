#!/bin/bash

printf 'Starting container postgres '
# docker network create --driver overlay backend &&
docker service create --name postgres \
  -p "5432:5432" \
  --host host=127.0.0.1 \
  --env-file .env-prod \
  -e POSTGRES_INITDB_OPTIONS='--encoding=UTF8 --locale=en_US.utf8' \
  --hostname infinitus \
  --mount type=volume,src=pg_data,dst=/var/lib/postgresql/data \
  --network backend \
  --limit-cpu 0.5 \
  --limit-memory 256M \
    postgres:16.4-alpine && 
docker service ls

# --network=host \
# Adicionar o network ao container.
# docker service update --network-add network container 