# TSSC OpenSCAP Image

This repository contains the Dockerfile and supporting files for creating the OpenSCAP TSSC image.

To build and push this image perform the following on a properly subscribed RHEL 8 host:
```
podman login quay.io
podman build . -t quay.io/tssc/tssc-tool-openscap:latest
podman push quay.io/quay_org/tssc-tool-openscap:latest
```

Test:

```
export container_image_url=quay.io/tssc/tssc-reference-app-quarkus-tssc
export container_image_tag=1.0.2-feature_napsspo-535

podman run --rm quay.io/tssc/tssc-tool-openscap:latest /bin/bash -c "
    echo -en \"Pulling image $container_image_url:$container_image_tag\n\n\";
    buildah from --storage-driver vfs --log-level debug docker://$container_image_url:$container_image_tag;
    container_id=$(buildah --storage-driver vfs containers -q);
    buildah mount --storage-driver vfs $container_id;
    echo -en \"\nRunning oscap-chroot scan\n\";
    oscap-chroot $(buildah --storage-driver vfs mount | awk '{print $2}') oval eval --report /tmp/report.html /usr/share/xml/scap/ssg/content/ssg-jre-oval.xml
    cat /tmp/report.html
    "
```
