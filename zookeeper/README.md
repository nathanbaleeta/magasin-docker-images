To verify the version # and mirror site, please visit this link below:
```
https://ftp.dimensiondata.com/mirrors/www.apache.org/zookeeper/
```

Navigate to the zookeeper direactory
```
cd zookeeper
```

Build the image
```
docker build -t zookeeper:3.8.3 .
```

PS: version 1.21.1 seems to have some breaking changes, use 1.20.3
