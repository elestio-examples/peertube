rm -rf config/*
rmdir config
cp -rf support/docker/production/* ./
rm -f docker-compose.yml
mv docker-compose-new.yml docker-compose.yml
mv Dockerfile.bookworm Dockerfile
docker buildx build . --output type=docker,name=elestio4test/peertube:latest | docker load
