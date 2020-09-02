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
