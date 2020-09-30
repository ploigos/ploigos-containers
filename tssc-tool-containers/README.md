# tssc-tool-containers

Defines a ci tools container that has tools for working with containers.
* buildah
* podman
* skopeo

**NOTE: Currently this image must be built on a RHEL 8 host that is properly subscribed in order to install its dependencies. For this reason, GitHub Actions are not yet defined to build this image.**

## Local Build

To build and push this image perform the following on a properly subscribed RHEL 8 host:
```
podman login quay.io/tssc
podman build . -t quay.io/tssc/tssc-tool-containers:latest
podman push quay.io/tssc/tssc-tool-containers:latest
```
