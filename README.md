# Integration of Domoticz logging and Splunk
The idea was to have smart home (Xiaomi SmartHome Kit) events logged into Splunk. Domoticz configuration is out of scope

# How it works
In current setup, there are 2 containers deployed in Raspberry PI 4:
- domoticz: Domoticz Server
- splunkforwarder: Splunk Universal Forwarder has domoticz.log mounted into container. Also it listens for UDP Syslog events from LAN (e.g. from router). Then it  forwards events to remote Splunk Enterprise

# Setup
1. Pre-configuration:
   1. [OPTIONAL] update ports/paths in docker-compose.yml, if updated - reflect paths changes in splunk_conf/inputs.conf
   1. update remote Splunk Enterprise host/ip and port in splunk_conf/outputs.conf
   1. [OPTIONAL] Restore Domoticz configuration DB in /opt/docker/domoticz/config/
1. Deploy with docker-compose up -d
