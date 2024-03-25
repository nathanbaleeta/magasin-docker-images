To verify the version # and mirror site, please visit this link below:
```
https://ftp.dimensiondata.com/mirrors/www.apache.org/zookeeper/
```

Navigate to the zookeeper direactory
```
cd zookeeper
```

## [Build & push the image to container registry](https://codestrian.com/index.php/2023/04/23/docker-multi-platform-build/#:~:text=Configuring%20BuildKit&text=In%20order%20to%20support%20multi,used%20by%20the%20new%20builder.&text=Next%2C%20we%20will%20create%20a,both%20AMD64%20and%20ARM64%20architectures)
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
 docker buildx build --platform linux/amd64 -t magasinacrdev.azurecr.io/zookeeper:3.7.2 --push .
```
OR
```
 docker buildx build --platform linux/amd64 -t nbaleeta/zookeeper:3.7.2 --push .
```

