#!/bin/bash

# Create a "hardcoded" configuration file .
# If it fails to connect, you may need to verify the keys in the 
# nexus433 documentation or their example .ini file.

cat <<EOF > /tmp/nexus433.ini
[mqtt]
host=core-mosquitto
port=1883
user=mqtt-nexus
password=_YOur_Pass_Here
clientid=nexus433

[transmitter]
silent_timeout_sec=900
minimum_frames=1
battery_low=0
battery_normal=100
discovery=yes
discovery_prefix=homeassistant

[receiver]
chip=/dev/gpiochip0
pin=17
pooling=false

[ignore]
8c01=true

[temperature]
8001=Nexus Outside Temperature

[humidity]
8001=Nexus Outside Humidity

[battery]
8001=Nexus Sensor Battery

[quality]
8001=Nexus Sensor Transmission Quality
EOF

date
echo "Starting Nexus433 with config /tmp/nexus433.ini..."

#echo "--- CONFIG FILE CONTENT ---"
#cat /tmp/nexus433.ini
#echo "---------------------------"

# Launching using the -g (config) flag
# We are passing the config file and the gpio device manually
/nexus433/build/nexus433 \
  -g /tmp/nexus433.ini
