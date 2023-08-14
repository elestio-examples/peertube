
cp -rf support/docker/production/* ./
docker buildx build . --output type=docker,name=elestio4test/peertube:latest | docker load