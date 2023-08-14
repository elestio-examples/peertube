#set env vars
#set -o allexport; source .env; set +o allexport;

mkdir -p ./assets
mkdir -p ./docker-volume/data
mkdir -p ./docker-volume/config
mkdir -p ./docker-volume/db
mkdir -p ./docker-volume/redis
mkdir -p ./docker-volume/opendkim/keys

chown -R 1001:1001 ./assets
chown -R 1001:1001 ./docker-volume/data
chown -R 1001:1001 ./docker-volume/config
chown -R 1001:1001 ./docker-volume/db
chown -R 1001:1001 ./docker-volume/redis
chown -R 1001:1001 ./docker-volume/opendkim/keys