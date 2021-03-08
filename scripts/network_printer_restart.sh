#!/usr/bin/env bash
# Due to the issue with print server on Wi-Fi router this script restarts print server there (via SSH) periodically

router_conn="<router_user>@<router_ip>"

echo -n "Restarting Network Printer Server. "
ssh ${router_conn} "service notify_rc && service restart_lpd && service restart_u2ec"
exit_code=$?
if [ $exit_code -eq 0 ]; then
	echo "COMPLETED"
else
	echo "FAILED with code: $exit_code"
	exit $exit_code
fi

