# ploigos-tool-containers

This repository contains the container definition for creating the Ploigos workflow
container CLI tools container image.

This container image is intended to be used as the container image to run Ploigos workflow steps
in that require access to CLI tools related to container image operations.

Included CLI tools:
* `buildah`
* `podman`
* `skopeo`

**NOTE: Currently this image must be built on a RHEL 8 host that is properly subscribed in order to install its dependencies. For this reason, GitHub Actions are not yet defined to build this image.**

## Local Build

To build and push this image perform the following on a properly subscribed RHEL 8 host:
```
podman login quay.io/ploigos
podman build . -t quay.io/ploigos/ploigos-tool-containers:latest
podman push quay.io/ploigos/ploigos-tool-containers:latest
```
