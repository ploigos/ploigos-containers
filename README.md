# tssc-containers
![license](https://img.shields.io/github/license/rhtconsulting/tssc-containers)
[![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/rhtconsulting/tssc-containers/publish/main?label=publish%3A%20edge&logo=open-containers-initiative)](https://github.com/rhtconsulting/tssc-containers/actions?query=workflow%3Apublish+branch%3Amain)

Container image definitions for the TSSC project

## tssc-base
[![tssc-base](https://img.shields.io/badge/quay.io-tssc--base-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-base)

Defines the base TSSC container image, from which all other TSSC images derive.

## tssc-base-java-8
[![tssc-base-java-8](https://img.shields.io/badge/quay.io-tssc--base--java--8-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-base)

Defines a Java 8 base container image, built on top of `tssc-base`, from which many TSSC tool images derive.

## tssc-ci-agent-jenkins
[![tssc-ci-agent-jenkins](https://img.shields.io/badge/quay.io-tssc--ci--agent--jenkins-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-ci-agent-jenkins)

Defines a jenkins agent as a sidecar for the `tssc-tool-*` containers. Built from `tssc-base-java-8`.

## tssc-tool-argocd
[![tssc-tool-argocd](https://img.shields.io/badge/quay.io-tssc--tool--argocd-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-tool-argocd)

Defines an ArgoCD container image. Built from `tssc-base`.

## tssc-tool-buildah
[![tssc-tool-buildah](https://img.shields.io/badge/quay.io-tssc--tool--buildah-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-tool-buildah)

> **_NOTE:_** This image is not automatically built by GitHub actions because it requires to be built on a subscribed RHEL 8 machine.

Defines a buildah container image. Built from `tssc-base`.

## tssc-tool-config-lint
[![tssc-tool-config-lint](https://img.shields.io/badge/quay.io-tssc--tool--config--lint-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-tool-config-lint)

Defines a [config-lint](https://github.com/stelligent/config-lint) container image. Built from `tssc-base`.

## tssc-tool-maven
[![tssc-tool-maven](https://img.shields.io/badge/quay.io-tssc--tool--maven-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-tool-maven)

Defines a maven container image. Built from `tssc-base-java-8`.

## tssc-tool-openscap
[![tssc-tool-openscap](https://img.shields.io/badge/quay.io-tssc--tool--openscap-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-tool-openscap)

> **_NOTE:_** This image is not automatically built by GitHub actions because it requires to be built on a subscribed RHEL 8 machine.

Defines an OpenSCAP based image scanning container image. Built from tssc-base.

## tssc-tool-skopeo
[![tssc-tool-skopeo](https://img.shields.io/badge/quay.io-tssc--tool--skopeo-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-tool-skopeo)

Defines a skopeo container image. Built from `tssc-base`.

## tssc-tool-sonar
[![tssc-tool-sonar](https://img.shields.io/badge/quay.io-tssc--tool--sonar-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/tssc/tssc-tool-sonar)

Defines a sonar-scanner container image. Built from `tssc-base`.

# Automatic Build, Test, and Publish

The following github events to this repository will cause the
[publish GitHub workflow](https://github.com/rhtconsulting/tssc-containers/actions?query=workflow%3Apublish)
to kick off which will build, test, publish the images (that can) to [quay.io/tssc](https://quay.io/organization/tssc).

## Events
* schedule
  - everyday at 10:00am
* push
  - branches
    * `main`
  - tags
    * `v*.*.*`
  - pull_request

## Images

* tssc-base
* tssc-ci-agent-jenkins
* tssc-tool-argocd
* tssc-tool-config-lint
* tssc-tool-maven
* tssc-tool-openscap
* tssc-tool-skopeo
* tssc-tool-sonar

# Local Build, Test, and Publish

## Build

The following commands can be used for building these images locally

```
# Run these commands from the directory where this repository was cloned

podman build --tag tssc-base tssc-base
podman build --build-arg FROM_IMAGE=tssc-base --tag tssc-base-java-8 tssc-base-java-8
podman build --build-arg FROM_IMAGE=tssc-base-java-8 --tag tssc-ci-agent-jenkins tssc-ci-agent-jenkins
podman build --build-arg FROM_IMAGE=tssc-base --tag tssc-tool-argocd tssc-tool-argocd
podman build --build-arg FROM_IMAGE=tssc-base --tag tssc-tool-buildah tssc-tool-buildah
podman build --build-arg FROM_IMAGE=tssc-base --tag tssc-tool-config-lint tssc-tool-config-lint
podman build --build-arg FROM_IMAGE=tssc-base-java-8 --tag tssc-tool-maven tssc-tool-maven
podman build --build-arg FROM_IMAGE=tssc-tool-buildah --tag tssc-tool-openscap tssc-tool-openscap
podman build --build-arg FROM_IMAGE=tssc-base --tag tssc-tool-skopeo tssc-tool-skopeo
podman build --build-arg FROM_IMAGE=tssc-base --tag tssc-tool-sonar tssc-tool-sonar
```
## Test

> **TODO**

## Publish
Steps for manually publishing the images that need to be manually published.

* tssc-tool-buildah
* tssc-tool-openscap

### Setup
Setup steps.
```
yum -y install podman, buildah
```

### Publish edge

#### Publish to quay.io/tssc
```
./manual-publish.sh
```
or
```
./manual-publish.sh edge tssc
```
or	
```
./manual-publish.sh edge tssc quay.io
```

#### Publish to personal quay.io repo
```
./manual-publish.sh edge $QUAY_USER_NAME
```
or
```
./manual-publish.sh edge $QUAY_USER_NAME quay.io
```

### Pubish release verson

#### Publish the v1.0.0 release version to quay.io/tssc
```
./manual-publish.sh v1.0.0
```

# How to Release?

1. tag this repository with the release version
   * ex: `v1.42.0`
   * __NOTE__: must start with `v`
2. manually publish the images that can't be automatically published
   * ex: `./manual-publish.sh v1.42.0 tssc quay.io`
