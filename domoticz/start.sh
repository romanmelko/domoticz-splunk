#!/usr/bin/env bash

SPLUNK_HOME=/opt/splunkforwarder
$SPLUNK_HOME/bin/splunk --answer-yes --no-prompt --accept-license start
while true; do sleep 1000; done

exit $?
