# ploigos-tool-quarkus-native

This repository contains the container definition for creating the Ploigos workflow
Quarkus native packaging container CLI tools container image.

This container image is intended to be used as the container image to run Ploigos workflow steps
that require access to CLI tools related to packaging Quarkus native images.

Included CLI tools:
* `mvn`
* `buildah`
* `podman`

## Local Build

To build and push this image perform the following on a properly subscribed RHEL 8 host:
```
podman login quay.io/ploigos
podman build . -t quay.io/ploigos/ploigos-tool-quarkus-native:latest
podman push quay.io/ploigos/ploigos-tool-quarkus-native:latest
```
