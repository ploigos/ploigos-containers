ARG FROM_IMAGE=quay.io/ploigos/ploigos-base:latest

FROM $FROM_IMAGE
ARG PLOIGOS_USER_UID
ARG SONAR_CLI=sonar-scanner-cli-4.4.0.2170-linux
ARG SONAR=sonar-scanner-4.4.0.2170-linux

LABEL com.redhat.component="ploigos-tool-sonar" \
      name="ploigos/ploigos-tool-sonar" \
      architecture="x86_64" \
      io.k8s.display-name="Ploigos sonar scanner" \
      io.k8s.description="The Ploigos sonar image provides the sonar  scanner executable" \
      io.openshift.tags="openshift,sonar,python,python3,python36" \
      maintainer="napsspo+ploigos@redhat.com"

USER 0

# Goal:
#    Install sonar-scanner for CLI.
#    Put $SONAR/bin in the PATH per documentation:
#        https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/
# Hint:
#    The executable is named sonar-scanner.
#    In python to execute, substitute the dash with underscore, eg: sh.sonar_scanner()
#        https://amoffat.github.io/sh/sections/faq.html
WORKDIR /usr/bin
RUN curl https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SONAR_CLI}.zip -o sonar.zip && \
unzip ./sonar.zip && \
rm ./sonar.zip && \
mv ./${SONAR} ./sonar && \
chown -R 1001:0 /usr/bin/sonar

ENV PATH /usr/bin/sonar/bin:$PATH

USER $PLOIGOS_USER_UID

##############################################
# End
##############################################
