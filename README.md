# ploigos-containers
[![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/ploigos/ploigos-containers/publish/main?label=publish%3A%20edge&logo=github-actions)](https://github.com/ploigos/ploigos-containers/actions?query=workflow%3Apublish+branch%3Amain)
<br />
[![license](https://img.shields.io/github/license/ploigos/ploigos-containers)](LICENSE)

Container image definitions for the Ploigos project

## ploigos-base
[![ploigos-base](https://img.shields.io/badge/quay.io-ploigos--base-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-base)

Defines the base Ploigos container image, from which all other Ploigos images derive.

## ploigos-ci-agent-jenkins
[![ploigos-ci-agent-jenkins](https://img.shields.io/badge/quay.io-ploigos--ci--agent--jenkins-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-ci-agent-jenkins)

Defines a jenkins agent as a sidecar for the `ploigos-tool-*` containers. Built from `ploigos-tool-java-8`.

## ploigos-jenkins
**To be deprecated.**

Custom Jenkins Controller that allows for CA root trust to be updated.

## ploigos-jenkins-init
**To be deprecated.**

Custom Jenkins init image which installs a preset set of Jenkins plugins.

## ploigos-tool-argocd
[![ploigos-tool-argocd](https://img.shields.io/badge/quay.io-ploigos--tool--argocd-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-argocd)

Defines an ArgoCD container image. Built from `ploigos-base`.

## ploigos-tool-config-lint
[![ploigos-tool-config-lint](https://img.shields.io/badge/quay.io-ploigos--tool--config--lint-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-config-lint)

Defines a [config-lint](https://github.com/stelligent/config-lint) container image. Built from `ploigos-base`.

## ploigos-tool-containers
[![ploigos-tool-containers](https://img.shields.io/badge/quay.io-ploigos--tool--containers-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-containers)

Defines a tools container that has tools for working with containers.
* buildah
* podman
* skopeo

Required Capabilities for rootless container building:
* SETUID
* SETGID

## ploigos-tool-helm
[![ploigos-tool-helm](https://img.shields.io/badge/quay.io-ploigos--tool--helm-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-helm)

Defines a tools container that has helm and helpful helm plugins.

Helm Plugins
* [helm-secrets (SOPS)](https://github.com/zendesk/helm-secrets)

## ploigos-tool-java-8
[![ploigos-tool-java-8](https://img.shields.io/badge/quay.io-ploigos--tool--java--8-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-java-8)

Defines a Java 8 base container image, built on top of `ploigos-base`, from which many Ploigos tool images derive.

## ploigos-tool-maven
[![ploigos-tool-maven](https://img.shields.io/badge/quay.io-ploigos--tool--maven-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-maven)

Defines a maven container image. Built from `ploigos-tool-java-8`.

## ploigos-tool-npm
[![ploigos-tool-npm](https://img.shields.io/badge/quay.io-ploigos--tool--npm-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-npm)

Defines a npm container image. Built from `ploigos-base`.

## ploigos-tool-openscap
[![ploigos-tool-openscap](https://img.shields.io/badge/quay.io-ploigos--tool--openscap-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-openscap)

Defines an OpenSCAP based image scanning container image. Built from ploigos-base.

## ploigos-tool-autogov
[![ploigos-tool-autogov](https://img.shields.io/badge/quay.io-ploigos--tool--autogov-lightgrey?logo=open-containers-initiative)](https://quay.io/repository/ploigos/ploigos-tool-autogov)

Defines a tools container that has the tools for doing auto governance. Built from `ploigos-base`.

Tools
* [rekor](https://github.com/sigstore/rekor)
* [opa](https://github.com/open-policy-agent)

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
  * ubi8
* ploigos-tool-java-8
  * ubi8
* ploigos-ci-agent-jenkins
  * ubi8
* ploigos-jenkins
  * ubi8
* ploigos-jenkins-init
  * ubi8
* ploigos-tool-argocd
  * ubi8
* ploigos-tool-config-lint
  * ubi8
* ploigos-tool-containers
  * ubi8
* ploigos-tool-helm
  * ubi8
* ploigos-tool-maven
  * ubi8
* ploigos-tool-nodejs
  * ubi8  
* ploigos-tool-openscap
  * ubi8
* ploigos-tool-autogov
  * ubi8
* ploigos-tool-sonar
  * ubi8
# Local Build, Test, and Publish

## Build

The following commands can be used for building these images locally.

```
podman build --tag ploigos-base                                                            ploigos-base
podman build --tag ploigos-ci-agent-jenkins --build-arg BASE_IMAGE=ploigos-tool-java-8     ploigos-ci-agent-jenkins
podman build --tag ploigos-jenkins                                                         ploigos-jenkins
podman build --tag ploigos-jenkins-init                                                    ploigos-jenkins-init
podman build --tag ploigos-tool-argocd      --build-arg BASE_IMAGE=ploigos-base            ploigos-tool-argocd
podman build --tag ploigos-tool-config-lint --build-arg BASE_IMAGE=ploigos-base            ploigos-tool-config-lint
podman build --tag ploigos-tool-containers  --build-arg BASE_IMAGE=ploigos-base            ploigos-tool-containers
podman build --tag ploigos-tool-helm        --build-arg BASE_IMAGE=ploigos-base            ploigos-tool-helm
podman build --tag ploigos-tool-java-8      --build-arg BASE_IMAGE=ploigos-base            ploigos-tool-java-8
podman build --tag ploigos-tool-maven       --build-arg BASE_IMAGE=ploigos-tool-java-8     ploigos-tool-maven
podman build --tag ploigos-tool-nodejs      --build-arg BASE_IMAGE=ploigos-base            ploigos-tool-nodejs
podman build --tag ploigos-tool-jkube       --build-arg BASE_IMAGE=ploigos-tool-maven      ploigos-tool-jkube
podman build --tag ploigos-tool-openscap    --build-arg BASE_IMAGE=ploigos-tool-containers ploigos-tool-openscap
podman build --tag ploigos-tool-autogov     --build-arg BASE_IMAGE=ploigos-autogov         ploigos-tool-autogov
podman build --tag ploigos-tool-sonar       --build-arg BASE_IMAGE=ploigos-base            ploigos-tool-sonar
```

## Test

> **TODO**
# How to Release?

1. tag this repository with the release version
   * ex: `v1.42.0`
   * __NOTE__: must start with `v`
