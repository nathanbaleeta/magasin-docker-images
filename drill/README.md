To verify the version # and mirror site, please visit this link below:
```
https://ftp.dimensiondata.com/mirrors/www.apache.org/drill
```

### Docker image release notes

| Version  | Release notes |
| ------------- | ------------- |
| 1.21.2-latest  | Upgraded to the following:  Drill 1.21.2, openjdk-21-jdk, azure-storage-8.6.6, hadoop-azure-3.4.0 |

Navigate to the ```drill``` directory
```
cd drill
```

## [Build & push the image to container registry](https://codestrian.com/index.php/2023/04/23/docker-multi-platform-build/#:~:text=Configuring%20BuildKit&text=In%20order%20to%20support%20multi,used%20by%20the%20new%20builder.&text=Next%2C%20we%20will%20create%20a,both%20AMD64%20and%20ARM64%20architectures)
#### Azure Container Registry Build Task
```
docker context create tls-environment
```
```
docker buildx create tls-environment \
  --name multiarch --driver docker-container \
  --platform linux/amd64 \
  --bootstrap --use
```

### To build from a single docker file
```
 docker buildx build --platform linux/amd64 -t baleetanathannacrdev.azurecr.io/drill:1.20.3 --push .
```
OR
```
 docker buildx build --platform linux/amd64 -t nbaleeta/drill:1.20.3 --push .
```

### To read & build from docker compose yaml, json or HCL file instead of single Dockerfile
```
docker buildx bake -f docker-compose-non-dev.yml
docker buildx build --platform linux/amd64 -t baleetanathanacrdev.azurecr.io/drill:1.20.3 --push .
```

#### Import docker hub image into Azure container registry
```
az acr import --name magasinacrdev --source docker.io/nbaleeta/drill:1.21.1 --image drill:1.21.1
```
