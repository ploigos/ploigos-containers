# ploigos-tool-openscap

This repository contains the container definition for creating the Ploigos workflow
[OpenSCAP](https://www.open-scap.org/tools/openscap-base/) CLI tool container image.

This container image is intended to be used as the container image to run Ploigos workflow steps
in that require access to the [OpenSCAP](https://www.open-scap.org/tools/openscap-base/) CLI tool.

**NOTE: Currently this image must be built on a RHEL 8 host that is properly subscribed in order to install its dependencies. For this reason, GitHub Actions are not yet defined to build this image.**

## Local Build

To build and push this image perform the following on a properly subscribed RHEL 8 host:
```
podman login quay.io
podman build . -t quay.io/ploigos/ploigos-tool-openscap:latest
podman push quay.io/ploigos/ploigos-tool-openscap:latest
```

## Local Test

```
export container_image_url=quay.io/tssc/tssc-reference-app-quarkus-tssc
export container_image_tag=1.0.2-feature_napsspo-535

podman run --rm quay.io/ploigos/ploigos-tool-openscap:latest /bin/bash -c "
    echo -en \"Pulling image $container_image_url:$container_image_tag\n\n\";
    buildah from --storage-driver vfs --log-level debug docker://$container_image_url:$container_image_tag;
    container_id=$(buildah --storage-driver vfs containers -q);
    buildah mount --storage-driver vfs $container_id;
    echo -en \"\nRunning oscap-chroot scan\n\";
    oscap-chroot $(buildah --storage-driver vfs mount | awk '{print $2}') oval eval --report /tmp/report.html /usr/share/xml/scap/ssg/content/ssg-jre-oval.xml
    cat /tmp/report.html
    "
```
