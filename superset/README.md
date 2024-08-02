

#### Build docker image and push to Azure container registry from docker-compose yaml file. 
#### Use bake with -f flag to specify which Docker Compose, JSON or HCL file to read from, then build image after
```
export DOCKER_DEFAULT_PLATFORM=linux/amd64
```
```
 docker buildx build -f docker-compose-non-dev.yml --platform linux/amd64 -t magasinacrdev.azurecr.io/superset:3.1.0 --push .
```

OR
```
docker buildx bake -f docker-compose-non-dev.yml

docker buildx build --platform linux/amd64 -t magasinacrdev.azurecr.io/superset:3.1.0 --push .
```
