ARG FROM_IMAGE=quay.io/tssc/tssc-base:latest
FROM $FROM_IMAGE

MAINTAINER Red Hat TSSC <napsspo+tssc@redhat.com>

LABEL architecture="x86_64" \
      com.redhat.component="tssc-tool-config-lint" \
      io.k8s.description="The TSSC config-lint image provides the config-lint executable" \ 
      io.k8s.display-name="TSSC config-lint scanner" \
      io.openshift.tags="openshift,config-lint,python,python3,python36" \
      maintainer="napsspo+tssc@redhat.com" \
      name="tssc/tssc-tool-config-lint" 

USER 0

WORKDIR /usr/local/bin
RUN curl -L https://github.com/stelligent/config-lint/releases/latest/download/config-lint_Linux_x86_64.tar.gz --output config-lint.tar.gz && \
tar xzf ./config-lint.tar.gz && \
rm ./config-lint.tar.gz && \
chmod 775 ./config-lint && \
chown 1001:0 ./config-lint

USER 1001

##############################################
# End
##############################################
