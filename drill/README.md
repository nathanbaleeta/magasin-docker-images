To verify the version # and mirror site, please visit this link below:
```
https://ftp.dimensiondata.com/mirrors/www.apache.org/drill
```

Navigate to the ```drill``` direactory
```
cd drill
```

Build & push the image to container registry
```
docker context create tls-environment
```
```
docker buildx create tls-environment \
  --name multiarch --driver docker-container \
  --platform linux/amd64 \
  --bootstrap --use
```

```
 docker buildx build --platform linux/amd64 -t magasinacrdev.azurecr.io/drill:1.20.3 --push .
```

```
 docker buildx build --platform linux/amd64 -t nbaleeta/drill:1.20.3 --push .
```
