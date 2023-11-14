## Base OS
FROM --platform=linux/amd64 ubuntu:22.04
MAINTAINER DCOE <nbaleeta@unicef.org>

## Set Version & Mirror variables
ARG VERSION=3.8.2
RUN echo $VERSION
ARG MIRROR=https://ftp.dimensiondata.com/mirrors/www.apache.org/zookeeper
RUN echo $MIRROR

## Install Pre-Requisite Packages
RUN apt-get update
RUN apt-get install --allow-downgrades --yes software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install --allow-downgrades --yes openjdk-17-jdk vim

## Configure User Login
RUN echo 'root:drill' | chpasswd

## Install Zookeeper
ADD $MIRROR/zookeeper-$VERSION/apache-zookeeper-$VERSION-bin.tar.gz /tmp/
RUN mkdir /opt/zookeeper
RUN tar -xzf /tmp/apache-zookeeper-$VERSION-bin.tar.gz --directory=/opt/zookeeper --strip-components 1
RUN rm -f /tmp/apache-zookeeper-$VERSION-bin.tar.gz

## Expose client, server & leader-election ports on container
EXPOSE 2181 2888 3888

## Configure ZooKeeper
RUN printf "tickTime=2000\ndataDir=/var/lib/zookeeper\nclientPort=2181" > /opt/zookeeper/conf/zoo.cfg

## Start Zookeeper
COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh
ENTRYPOINT ["/usr/bin/start.sh"]

