# tssc-containers
Container image definitions for the TSSC project

## tssc-base
[![tssc-base-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-base-publish/badge.svg?branch=master)](https://quay.io/repository/tssc/tssc-base)

Defines the base TSSC container image, from which all other TSSC images derive.

## tssc-ci-agent-jenkins
[![tssc-ci-agent-jenkins-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-ci-agent-jenkins-publish/badge.svg?branch=master)](https://quay.io/repository/tssc/tssc-ci-agent-jenkins)

Defines a jenkins agent as a sidecar for the `tssc-tool-*` containers

## tssc-tool-buildah
[tssc-tool-buildah | Manual Build](https://quay.io/repository/tssc/tssc-tool-buildah)

> **_NOTE:_** This image is not automatically built by GitHub actions because it requires to be built on a subscribed RHEL 8 machine recently.

Defines a buildah container image. Built from tssc-base.

## tssc-tool-maven
[![tssc-tool-maven-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-tool-maven-publish/badge.svg?branch=master)](https://quay.io/repository/tssc/tssc-tool-maven)

Defines a java / maven container image. Built from tssc-base.

## tssc-tool-skopeo
[![tssc-tool-skopeo-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-tool-skopeo-publish/badge.svg?branch=master)](https://quay.io/repository/tssc/tssc-tool-skopeo)

Defines a skopeo container image. Built from tssc-base.

## tssc-tool-argocd
[![tssc-tool-argocd-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-tool-argocd-publish/badge.svg?branch=master)](https://quay.io/repository/tssc/tssc-tool-argocd)

Defines an ArgoCD container image. Built from tssc-base.

## tssc-tool-sonar
[![tssc-tool-sonar-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-tool-sonar-publish/badge.svg?branch=master)](https://quay.io/repository/tssc/tssc-tool-sonar)

Defines a sonar-scanner container image. Built from tssc-base.


# Building locally for testing

The following commands can be used for building these images locally

```
# Run these commands from the directory where this repository was cloned

podman build tssc-base tssc-base
podman build --build-arg FROM_IMAGE=tssc-base -t tssc-tool-maven tssc-tool-maven
podman build --build-arg FROM_IMAGE=tssc-base -t tssc-ci-agent-jenkins tssc-ci-agent-jenkins
```
