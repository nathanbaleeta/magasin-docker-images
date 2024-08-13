
FROM --platform=linux/amd64 ubuntu:22.04
LABEL maintainer="Nathan Baleeta nbaleeta@unicef.org"

ARG VERSION=1.21.1
RUN echo $VERSION
ARG MIRROR=https://ftp.dimensiondata.com/mirrors/www.apache.org/drill
RUN echo $MIRROR

# Install Pre-Requisite Packages 
RUN apt-get update
RUN apt-get install --allow-downgrades --yes software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install --allow-downgrades --yes openjdk-17-jdk vim

# Configure User Login
RUN echo 'root:drill' | chpasswd

# Install Drill
ADD $MIRROR/$VERSION/apache-drill-$VERSION.tar.gz /tmp/
RUN mkdir /opt/drill
RUN tar -xzf /tmp/apache-drill-$VERSION.tar.gz --directory=/opt/drill --strip-components 1
RUN rm -f /tmp/apache-drill-$VERSION.tar.gz

# Install Azure Jars on the classpath
# https://bigeval.com/docs/user/datasources/apache-drill/configuring-apache-drill-for-azure-blob-storage/
# https://drill.apache.org/docs/azure-blob-storage-plugin/
RUN wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.7/hadoop-azure-2.7.7.jar  -P /opt/drill/jars/3rdparty
RUN wget https://repo1.maven.org/maven2/com/microsoft/azure/azure-storage/8.0.0/azure-storage-8.0.0.jar  -P /opt/drill/jars/3rdparty

## Expose http, userport, controlport & dataport on container
EXPOSE 8047 31010 31011 31012

# Test Drill
RUN echo "select * from sys.version;" > /tmp/version.sql
RUN /opt/drill/bin/sqlline -u jdbc:drill:zk=local --run=/tmp/version.sql

# Start Drill 
COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh
ENTRYPOINT ["/usr/bin/start.sh"]

