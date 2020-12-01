ARG FROM_IMAGE=quay.io/ploigos/ploigos-base:latest

FROM quay.io/skopeo/stable:latest as skopeoimage

FROM $FROM_IMAGE
ARG PLOIGOS_USER_UID

LABEL com.redhat.component="ploigos-tool-skopeo" \
      name="ploigos/ploigos-tool-skopeo" \
      architecture="x86_64" \
      io.k8s.display-name="Ploigos skopeo" \
      io.k8s.description="The Ploigos skopeo image provides the skopeo executable" \
      io.openshift.tags="ploigos,openshift,skopeo,python,python3,python36" \
      maintainer="napsspo+ploigos@redhat.com"

USER 0
COPY --from=skopeoimage /usr/bin/skopeo /usr/bin/skopeo
RUN chown 1001:0 /usr/bin/skopeo && \
    chmod 555 /usr/bin/skopeo && \
    mkdir -p /etc/containers

ADD policy.json /etc/containers/policy.json

RUN chmod 775 /etc/containers/ && \
    chmod 664 /etc/containers/* && \
    chown -R 1001:0 /etc/containers/

USER $PLOIGOS_USER_UID

ENTRYPOINT [ "/usr/bin/skopeo" ]

##############################################
# End
##############################################

