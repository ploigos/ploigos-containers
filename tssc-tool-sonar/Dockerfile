ARG SONAR_CLI=sonar-scanner-cli-4.4.0.2170-linux
ARG SONAR=sonar-scanner-4.4.0.2170-linux

ARG FROM_IMAGE=quay.io/tssc/tssc-base:latest
FROM $FROM_IMAGE
MAINTAINER Red Hat TSSC <napsspo+tssc@redhat.com>

LABEL com.redhat.component="tssc-tool-sonar" \
      name="tssc/tssc-tool-sonar" \
      architecture="x86_64" \
      io.k8s.display-name="TSSC sonar scanner" \
      io.k8s.description="The TSSC sonar image provides the sonar  scanner executable" \ 
      io.openshift.tags="openshift,sonar,python,python3,python36" \
      maintainer="napsspo+tssc@redhat.com"

USER 0

# Goal: Install sonar files and get $SONAR/bin in the PATH per documentation:
#    https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/ 
# Goal: Rename sonar-scanner sonarscanner (removing the dash)
WORKDIR /usr/bin
RUN curl https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SONAR_CLI}.zip -o sonar.zip \
&& unzip ./sonar.zip \
&& rm ./sonar.zip \
&& chown 1001:0 ./${SONAR} \
&& mv ./${SONAR} ./sonar \
&& mv ./sonar/bin/sonar-scanner ./sonar/bin/sonarscanner

ENV PATH /usr/bin/sonar/bin:$PATH

USER 1001

ENTRYPOINT [ "/usr/bin/sonar" ]

##############################################
# End
##############################################
