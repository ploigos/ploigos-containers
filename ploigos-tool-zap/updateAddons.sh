#!/bin/bash

ADDON_OPTIONS=""

for I in $(echo $ZAPROXY_ADDONS); do
  ADDON_OPTIONS=${ADDON_OPTIONS}" -addoninstall ${I}"
done

./zap.sh -addonupdate -cmd
./zap.sh ${ADDON_OPTIONS} -cmd
