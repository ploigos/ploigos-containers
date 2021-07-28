#!/bin/bash

# update subgid and subuid for our current id
# NOTE: can not use usermod because also requires permisions to /etc/passwd
echo $(whoami):10000:65536 >> /etc/subuid
echo $(whoami):10000:65536 >> /etc/subgid

# create a podman socket for JKube to use
# SEE https://github.com/fabric8io/docker-maven-plugin/issues/1330#issuecomment-872905283
podman system service --time=0 ${DOCKER_HOST} 1> /home/ploigos/podman.stdout 2> /home/ploigos/podman.stderr &

# call the base entrypoint
/ploigos-base-entrypoint.sh "$@"
