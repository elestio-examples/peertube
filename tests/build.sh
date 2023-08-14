cp -rf support/docker/production/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml

docker buildx build . -f Dockerfile.bullseye --output type=docker,name=elestio4test/peertube:latest | docker load