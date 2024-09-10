docker network create --driver overlay backend &&
docker service create --name postgres \
  -p "5432:5432" \
  -e POSTGRES_PASSWORD=markes314 \
  -e POSTGRES_USER=markes \
  -e POSTGRES_DB=infinitus \
  -e POSTGRES_INITDB_OPTIONS='--encoding=UTF8 --locale=en_US.utf8' \
  --hostname infinitusdb \
  --mount type=volume,src=pg_data,dst=/var/lib/postgresql/data \
  --network backend \
  --limit-cpu 0.5 \
  --limit-memory 256M \
    postgres:16.4-alpine && 
docker service ls

# Adicionar o network ao container.
# docker service update --network-add network container 