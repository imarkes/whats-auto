docker compose -f docker-swarm.yaml build &&
echo "imagem buildada para execução" &&
docker stack rm nginx &&
echo "removido qualquer stack de nginx no ambiente docker" &&
docker stack deploy --compose-file=docker-swarm.yaml nginx &&
echo "realizado deploy da stack docker swarm"