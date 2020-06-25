# tssc-containers
Container image definitions for the TSSC project

## tssc-base
[![tssc-base-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-base-publish/badge.svg?branch=master)](https://quay.io/repository/tssc/tssc-base)

Defines the base TSSC container image, from which all other TSSC images derive.

## tssc-tool-maven
[![tssc-tool-maven-publish](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-tool-maven-publish/badge.svg?branch=master)](https://quay.io/repository/tssc/tssc-tool-maven)

Defines a java / maven container image. Built from tssc-base.

## tssc-ci-agent-jenkins
[![tssc-ci-agent-jenkins](https://github.com/rhtconsulting/tssc-containers/workflows/tssc-ci-agent-jenkins/badge.svg?branch=master)](https://quay.io/repository/tssc/tssc-ci-agent-jenkins)

Defines a jenkins agent as a sidecar for the `tssc-tool-*` containers

# Building locally for testing

The following commands can be used for building these images locally

```
# Run these commands from the directory where this repository was cloned

podman build tssc-base tssc-base
podman build --build-arg FROM_IMAGE=tssc-base -t tssc-tool-maven tssc-tool-maven
podman build --build-arg FROM_IMAGE=tssc-base -t tssc-ci-agent-jenkins tssc-ci-agent-jenkins
```