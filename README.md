# ploigos-containers
[![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/rhtconsulting/ploigos-containers/publish/main?label=publish%3A%20edge&logo=github-actions)](https://github.com/rhtconsulting/ploigos-containers/actions?query=workflow%3Apublish+branch%3Amain)
<br />
[![license](https://img.shields.io/github/license/rhtconsulting/ploigos-containers)](LICENSE)

Container image definitions for the Ploigos project

## ploigos-base
[![ploigos-base](https://img.shields.io/badge/quay.io-ploigos--base-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-base)

Defines the base Ploigos container image, from which all other Ploigos images derive.

## ploigos-base-java-8
[![ploigos-base-java-8](https://img.shields.io/badge/quay.io-ploigos--base--java--8-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-base)

Defines a Java 8 base container image, built on top of `ploigos-base`, from which many Ploigos tool images derive.

## ploigos-ci-agent-jenkins
[![ploigos-ci-agent-jenkins](https://img.shields.io/badge/quay.io-ploigos--ci--agent--jenkins-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-ci-agent-jenkins)

Defines a jenkins agent as a sidecar for the `ploigos-tool-*` containers. Built from `ploigos-base-java-8`.

## ploigos-tool-argocd
[![ploigos-tool-argocd](https://img.shields.io/badge/quay.io-ploigos--tool--argocd-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-argocd)

Defines an ArgoCD container image. Built from `ploigos-base`.

## ploigos-tool-containers
[![ploigos-tool-containers](https://img.shields.io/badge/quay.io-ploigos--tool--containers-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-containers)

> **_NOTE:_** This image is not automatically built by GitHub actions because it requires to be built on a subscribed RHEL 8 machine.

Defines a ci tools container that has tools for working with containers.
* buildah
* podman
* skopeo

## ploigos-tool-config-lint
[![ploigos-tool-config-lint](https://img.shields.io/badge/quay.io-ploigos--tool--config--lint-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-config-lint)

Defines a [config-lint](https://github.com/stelligent/config-lint) container image. Built from `ploigos-base`.

## ploigos-tool-maven
[![ploigos-tool-maven](https://img.shields.io/badge/quay.io-ploigos--tool--maven-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-maven)

Defines a maven container image. Built from `ploigos-base-java-8`.

## ploigos-tool-openscap
[![ploigos-tool-openscap](https://img.shields.io/badge/quay.io-ploigos--tool--openscap-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-openscap)

> **_NOTE:_** This image is not automatically built by GitHub actions because it requires to be built on a subscribed RHEL 8 machine.

Defines an OpenSCAP based image scanning container image. Built from ploigos-base.

## ploigos-tool-sonar
[![ploigos-tool-sonar](https://img.shields.io/badge/quay.io-ploigos--tool--sonar-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-sonar)

Defines a sonar-scanner container image. Built from `ploigos-base`.

# Automatic Build, Test, and Publish

The following github events to this repository will cause the
[publish GitHub workflow](https://github.com/rhtconsulting/ploigos-containers/actions?query=workflow%3Apublish)
to kick off which will build, test, publish the images (that can) to [quay.io/ploigos](https://quay.io/organization/ploigos).

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

* ploigos-base
* ploigos-ci-agent-jenkins
* ploigos-tool-argocd
* ploigos-tool-config-lint
* ploigos-tool-maven
* ploigos-tool-openscap
* ploigos-tool-sonar

# Local Build, Test, and Publish

## Build

The following commands can be used for building these images locally

```
# Run these commands from the directory where this repository was cloned

podman build --tag ploigos-base ploigos-base
podman build --build-arg FROM_IMAGE=ploigos-base --tag ploigos-tool-helm ploigos-tool-helm
podman build --build-arg FROM_IMAGE=ploigos-base --tag ploigos-base-java-8 ploigos-base-java-8
podman build --build-arg FROM_IMAGE=ploigos-base-java-8 --tag ploigos-ci-agent-jenkins ploigos-ci-agent-jenkins
podman build --build-arg FROM_IMAGE=ploigos-base --tag ploigos-tool-argocd ploigos-tool-argocd
podman build --build-arg FROM_IMAGE=ploigos-base --tag ploigos-tool-containers ploigos-tool-containers
podman build --build-arg FROM_IMAGE=ploigos-base --tag ploigos-tool-config-lint ploigos-tool-config-lint
podman build --build-arg FROM_IMAGE=ploigos-base-java-8 --tag ploigos-tool-maven ploigos-tool-maven
podman build --build-arg FROM_IMAGE=ploigos-tool-containers --tag ploigos-tool-openscap ploigos-tool-openscap
podman build --build-arg FROM_IMAGE=ploigos-base --tag ploigos-tool-sonar ploigos-tool-sonar
```
## Test

> **TODO**

## Publish
Steps for manually publishing the images that need to be manually published.

* ploigos-tool-containers
* ploigos-tool-openscap

### Setup
Setup steps.
```
yum -y install podman, buildah
```

### Publish edge

#### Publish to quay.io/ploigos
```
./manual-publish.sh
```
or
```
./manual-publish.sh edge ploigos
```
or
```
./manual-publish.sh edge ploigos quay.io
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

#### Publish the v1.0.0 release version to quay.io/ploigos
```
./manual-publish.sh v1.0.0
```

# How to Release?

1. tag this repository with the release version
   * ex: `v1.42.0`
   * __NOTE__: must start with `v`
2. manually publish the images that can't be automatically published
   * ex: `./manual-publish.sh v1.42.0 ploigos quay.io`
