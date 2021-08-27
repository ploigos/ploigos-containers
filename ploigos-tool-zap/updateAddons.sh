#!/bin/bash

ADDON_OPTIONS=""

for I in $(echo $ZAPROXY_ADDONS); do
  ADDON_OPTIONS=${ADDON_OPTIONS}" -addoninstall ${I}"
done

./zap.sh -dir /home/.ZAP -addonupdate -cmd
./zap.sh -dir /home/.ZAP ${ADDON_OPTIONS} -cmd
