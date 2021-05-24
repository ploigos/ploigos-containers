#!/bin/bash

IMAGE_REPOSITORY=${REGISTRY_URI}/${REGISTRY_REPOSITORY}/${IMAGE_NAME}

# determine version
# if scheduled build then version is 'nightly'
# else if REF is a tag then version is tag
# else if REF is the default branch then version is 'edge
# else if REF is pull request then version is pull request event number
VERSION=noop
if [ "${GITHUB_EVENT_NAME}" == "schedule" ]; then
    VERSION=nightly
elif [[ ${GITHUB_REF} == refs/tags/* ]]; then
    VERSION=${GITHUB_REF#refs/tags/}
elif [[ ${GITHUB_REF} == refs/heads/* ]]; then
    VERSION=$(echo ${GITHUB_REF#refs/heads/} | sed -r 's#/+#-#g')
    if [ "${GITHUB_EVENT_REPOSITORY_DEFAULT_BRANCH}" = "$VERSION" ]; then
        VERSION=edge
    fi
elif [[ ${GITHUB_REF} == refs/pull/* ]]; then
    VERSION=pr-${GITHUB_EVENT_NUMBER}
fi
VERSION="${VERSION}"
TAGS="${IMAGE_REPOSITORY}:${VERSION}"

# if version is vMAJOR.MINOR.MICRO then also tag with vMAJOR and vMAJOR.MINOR
if [[ $VERSION =~ ^v[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    MINOR=${VERSION%.*}
    MAJOR=${MINOR%.*}
    TAGS="${TAGS},${IMAGE_REPOSITORY}:${MINOR},${IMAGE_REPOSITORY}:${MAJOR},${IMAGE_REPOSITORY}:latest"
fi

# add sha tag if not a pull request
if [[ ${GITHUB_REF} != refs/pull/* ]]; then
    TAGS="${TAGS},${IMAGE_REPOSITORY}:sha-${GITHUB_SHA::12}"
fi

# if a flavor is provided then iterate each tag and add the flavor to it
# if IMAGE_IS_DEFAULT_FLAVOR is also true, then also use the unflavored tags
if [[ ${IMAGE_TAG_FLAVOR} ]] ; then
    original_tags=$TAGS
    TAGS=""

    for original_tag in $(echo $original_tags | sed "s/,/ /g")
    do
        if [[ ${IMAGE_IS_DEFAULT_FLAVOR} =~ true|True|t|T|yes|Yes|y|Y ]]; then
            new_tags="${original_tag},${original_tag}${IMAGE_TAG_FLAVOR}"
        else
            new_tags="${original_tag}${IMAGE_TAG_FLAVOR}"
        fi

        if [[ ${TAGS} ]]; then
            TAGS="${TAGS},${new_tags}"
        else
            TAGS="${new_tags}"
        fi
    done
fi

# set output for future github action steps
echo ::set-output name=version::${VERSION}${IMAGE_TAG_FLAVOR}
echo ::set-output name=tags::${TAGS}
echo ::set-output name=created::$(date -u +'%Y-%m-%dT%H:%M:%SZ')
