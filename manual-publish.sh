#!/bin/bash

# PARAMS
#   $1 - image version
#   $2 - registry repository
#   $3 - registry uri

build_tag_push() {
    IMAGE_NAME=$1
    FROM_IMAGE_NAME=$2

    echo BUILD: ${IMAGE_NAME}
    podman build --build-arg FROM_IMAGE=${REGISTRY_URI}/${REGISTRY_REPOSITORY}/${FROM_IMAGE_NAME}:${IMAGE_VERSION} --tag ${IMAGE_NAME} --pull-always ${IMAGE_NAME}

    for IMAGE_TAG in ${IMAGE_TAGS}; do
        FULL_TAG="${REGISTRY_URI}/${REGISTRY_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}"
        echo "TAG: ${FULL_TAG}"
        buildah tag localhost/${IMAGE_NAME} ${FULL_TAG}
    
        echo "PUSH: ${FULL_TAG}"
        buildah push ${FULL_TAG}
    done
}

if [ -z "$1" ]; then
    IMAGE_VERSION='edge'
else
    IMAGE_VERSION=$1
fi

if [ -z "$2" ]; then
    REGISTRY_REPOSITORY='tssc'
else
    REGISTRY_REPOSITORY=$2
fi

if [ -z "$3" ]; then
    REGISTRY_URI='quay.io'
else
    REGISTRY_URI=$3
fi

GIT_REV=$(git rev-parse HEAD)
GIT_HASH_TAG=sha-${GIT_REV::8}

echo
echo --------------------
echo
echo "LOGIN: ${REGISTRY_URI}"
buildah login ${REGISTRY_URI}

echo
echo --------------------
echo
echo CALCULATE TAGS
IMAGE_TAGS="${IMAGE_VERSION} ${GIT_HASH_TAG}"
if [[ $IMAGE_VERSION =~ ^v[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    MINOR=${IMAGE_VERSION%.*}
    MAJOR=${MINOR%.*}
    IMAGE_TAGS="${IMAGE_TAGS} ${MINOR} ${MAJOR} latest"
fi

echo
echo --------------------
echo
echo CONFIRMATION
echo "    IMAGES: tssc-tool-containers tssc-tool-openscap"
echo "    IMAGE VERSION: ${IMAGE_VERSION}"
echo "    IMAGE TAGS: ${IMAGE_TAGS}"
echo "    REGISTRY REPOSITORY: ${REGISTRY_REPOSITORY}"
echo "    REGISTRY_URI: ${REGISTRY_URI}"
echo

read -p "Are you sure you want to build, tag, and push? (Y/N): "
if ! [[ $REPLY =~ ^[Yy]$ ]]; then
  exit 1
fi

########################
# tssc-tool-containers #
########################
echo
echo --------------------
echo
IMAGE_NAME=tssc-tool-containers
FROM_IMAGE_NAME=tssc-base
build_tag_push ${IMAGE_NAME} ${FROM_IMAGE_NAME}

######################
# tssc-tool-openscap #
######################
echo
echo --------------------
echo
IMAGE_NAME=tssc-tool-openscap
FROM_IMAGE_NAME=tssc-tool-containers
build_tag_push ${IMAGE_NAME} ${FROM_IMAGE_NAME}

