#!/bin/bash

# set -e: exit asap if a command exits with a non-zero status
set -e

HUB_HOST="0.0.0.0"
HUB_PORT=4444

ROOT=/opt/selenium_node
CONF=${ROOT}/config.json
JAVA_OPTS="${JAVA_OPTS} -Dwebdriver.chrome.whitelistedIps"
/opt/bin/generate_chrome_config >${CONF}

echo "Starting Selenium Hub with configuration:"
cat ${CONF}


#/opt/bin/generate_chrome_config > /opt/selenium_node/config.json

## Start the pulseaudio server
#pulseaudio -D --exit-idle-time=-1

## Load the virtual sink and set it as default
#pacmd load-module module-virtual-sink sink_name=v1
#pacmd set-default-sink v1

## set the monitor of v1 sink to be the default source
#pacmd set-default-source v1.monitor

rm -f /tmp/.X*lock
echo "JAVA_OPTS: ${JAVA_OPTS}"
echo "HUB_HOST: ${HUB_HOST}"
echo "HUB_PORT: ${HUB_PORT}"
echo "NODE_PORT: ${NODE_PORT}"
echo "SE_OPTS: ${SE_OPTS}"
java ${JAVA_OPTS} -jar /opt/selenium_node/selenium-server-standalone.jar -role node \
  -hub http://"${HUB_HOST}":"${HUB_PORT}"/grid/register \
  -port "${NODE_PORT}"
  ${SE_OPTS}
