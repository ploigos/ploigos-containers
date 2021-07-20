#!/bin/bash

# update subgid and subuid for our current id
# NOTE: can not use usermod because also requires permisions to /etc/passwd
echo $(whoami):10000:65536 >> /etc/subuid
echo $(whoami):10000:65536 >> /etc/subgid

# call the base entrypoint
/ploigos-base-entrypoint.sh "$@"
