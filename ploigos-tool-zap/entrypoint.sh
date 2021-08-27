#!/bin/bash

/zap/zap.sh -daemon -host 0.0.0.0 -port ${ZAP_PORT:-8080} -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true -config api.disablekey=true
