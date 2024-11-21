#!/bin/bash

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Build docker image for Magasin Zookeeper cluster coordinator"
   echo
   echo "Syntax: scriptTemplate [-r|t|v]"
   echo "options:"
   echo "r - Specify container registry."
   echo "t - Specify docker image tag."
   echo "v - Specify docker image version."
   echo
   echo "For example:"
   echo 
   echo "build_upload_image.sh -r myregistry.azurecr.io -t zookeeper -v 3.7.2"
   echo
}


############################################################
# Main program                                             #
############################################################

# Set variables
REGISTRY=""
TAG=""
VERSION=""

############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts ":r:t:v:" option; do
   case $option in
      r) # Enter container registry 
         REGISTRY=$OPTARG;;
      t) # Enter container tag 
         TAG=$OPTARG;;
      v) # Enter image version 
         VERSION=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

Help

############################################################
# Validate the input options before building image         #
############################################################
if [[ ${REGISTRY} == "" ]]
then
  echo "Please enter the Container registry name string. For ex: ACR or dockerhub"
  exit -1
fi

if [[ ${TAG} == "" ]]
then
  echo "Please enter the Container TAG name string. For ex: zookeeper"
  exit -1
fi


if [[ ${VERSION} == "" ]]
then
  echo "Please enter the ZooKeeper VERSION string. For ex: 3.7.2"
  exit -1
fi

############################################################
# Build the Docker image                                   #
############################################################

docker buildx build --build-arg VERSION=${VERSION} \
                    --platform linux/amd64 \
                    -t ${REGISTRY}/${TAG}:${VERSION} \
                    --push .




