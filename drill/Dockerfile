FROM --platform=linux/amd64 ubuntu:22.04

ARG VERSION=1.20.3
RUN echo $VERSION
ARG MIRROR=https://ftp.dimensiondata.com/mirrors/www.apache.org/drill
RUN echo $MIRROR

# Install Pre-Requisite Packages 
RUN apt-get update
RUN apt-get install --allow-downgrades --yes software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install --allow-downgrades --yes openjdk-17-jdk vim

# Configure User Login
RUN echo 'root:drill' | chpasswd

# Install Drill
ADD $MIRROR/$VERSION/apache-drill-$VERSION.tar.gz /tmp/
RUN mkdir /opt/drill
RUN tar -xzf /tmp/apache-drill-$VERSION.tar.gz --directory=/opt/drill --strip-components 1
RUN rm -f /tmp/apache-drill-$VERSION.tar.gz

## Expose http, userport, controlport & dataport on container
EXPOSE 8047 31010 31011 31012

# Test Drill
RUN echo "select * from sys.version;" > /tmp/version.sql
RUN /opt/drill/bin/sqlline -u jdbc:drill:zk=local --run=/tmp/version.sql

# Start Drill 
COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh
ENTRYPOINT ["/usr/bin/start.sh"]

