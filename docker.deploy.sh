#/bain/bash

docker stack rm zbx-proxy
sleep 20
docker stack deploy -c docker-compose.yml zbx-proxy

