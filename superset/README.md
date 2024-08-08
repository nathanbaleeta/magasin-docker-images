#### Quick set up
```
git clone https://github.com/apache/superset.git

cd superset

git checkout 4.0.0
```

#### Build docker image from scratch and push to Azure container registry from docker-compose yaml file. 

```
export DOCKER_DEFAULT_PLATFORM=linux/amd64
```


### Build Docker-image from Dockerfile with
Add `SUPERSET_SECRET_KEY` ENV variable to `Dockerfile` before building image
```
docker build -f Dockerfile -t superset .
docker build --no-cache -f Dockerfile -t superset . 
```

and run with:
```
docker run -p 8088:8088 superset
```
#### Build image from docker-compose - not recommended for production
#### Use bake with -f flag to specify which Docker Compose, JSON or HCL file to read from, then build image after
```
 docker buildx build -f docker-compose-non-dev.yml --platform linux/amd64 -t magasinacrdev.azurecr.io/superset:3.1.0 --push .
```

OR
```
docker buildx bake -f docker-compose-non-dev.yml

docker buildx build --platform linux/amd64 -t magasinacrdev.azurecr.io/superset:3.1.0 --push .
```
