#!/bin/bash
set -o errexit

# always update CA trust
update-ca-trust

# if params given, execute them as is
# else puase indefinitly
if [ "$1" ]; then
  exec "$@"
else
  cat
fi
