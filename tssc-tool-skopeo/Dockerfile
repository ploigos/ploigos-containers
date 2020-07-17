ARG FROM_IMAGE=quay.io/tssc/tssc-base:latest
FROM quay.io/skopeo/stable:latest as skopeoimage

FROM $FROM_IMAGE
MAINTAINER Red Hat TSSC <napsspo+tssc@redhat.com>

LABEL com.redhat.component="tssc-tool-skopeo" \
      name="tssc/tssc-tool-skopeo" \
      architecture="x86_64" \
      io.k8s.display-name="TSSC skopeo" \
      io.k8s.description="The TSSC skopeo image provides the skopeo executable" \ 
      io.openshift.tags="openshift,skopeo,python,python3,python36" \
      maintainer="napsspo+tssc@redhat.com"

USER 0
COPY --from=skopeoimage /usr/bin/skopeo /usr/bin/skopeo
RUN chown 1001:0 /usr/bin/skopeo && \
    chmod 555 /usr/bin/skopeo && \
    mkdir -p /etc/containers  

ADD policy.json /etc/containers/policy.json

RUN chmod 775 /etc/containers/ && \
    chmod 664 /etc/containers/* && \
    chown -R 1001:0 /etc/containers/

USER 1001

ENTRYPOINT [ "/usr/bin/skopeo" ]

##############################################
# End
##############################################

