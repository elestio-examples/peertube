#!/usr/bin/env bash
sed -i "s~volumes~#volumes~g" ./docker-compose.yml
sed -i "s~- ./assets:/app/client/dist~#- ./assets:/app/client/dist~g" ./docker-compose.yml
sed -i "s~- ./data-volume/data:/data~#- ./data-volume/data:/data~g" ./docker-compose.yml
sed -i "s~- /data-volume/config:/config~#- /data-volume/config:/config~g" ./docker-compose.yml
sed -i "s~- ./data-volume/db:/var/lib/postgresql/data~#- ./data-volume/db:/var/lib/postgresql/data~g" ./docker-compose.yml
sed -i "s~- ./data-volume/redis:/data~#- ./data-volume/redis:/data~g" ./docker-compose.yml
docker-compose up -d;
sleep 45s;
sed -i "s~#volumes~volumes~g" ./docker-compose.yml
sed -i "s~#- ./assets:/app/client/dist~- ./assets:/app/client/dist~g" ./docker-compose.yml
sed -i "s~#- ./data-volume/data:/data~- ./data-volume/data:/data~g" ./docker-compose.yml
sed -i "s~#- /data-volume/config:/config~- /data-volume/config:/config~g" ./docker-compose.yml
sed -i "s~#- ./data-volume/db:/var/lib/postgresql/data~- ./data-volume/db:/var/lib/postgresql/data~g" ./docker-compose.yml
sed -i "s~#- ./data-volume/redis:/data~- ./data-volume/redis:/data~g" ./docker-compose.yml