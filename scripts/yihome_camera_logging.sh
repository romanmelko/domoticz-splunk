#!/usr/bin/env bash
# This script enables IPTABLES logging on Wi-Fi router (via SSH) for Yi Home Camera so logs can be analyzed in Splunk or other tool for camera activity detection

camera_ip="<camera_ip>"
router_conn="<router_user>@<router_ip>"

echo -n "Check for ${camera_ip} camera logging: "
if [[ $(ssh ${router_conn} iptables -L | grep LOG | grep ${camera_ip} | wc -l) -eq 0 ]]; then
	echo -n "Disabled. "
	ssh ${router_conn} iptables -I FORWARD -s ${camera_ip} -j LOG
	exit_code=$?
	if [ $exit_code -eq 0 ]; then
		echo "Enabled"
	else
		echo "Failed to enable. Code: $exit_code"
		exit $exit_code
	fi
else
	echo "Enabled"
fi

