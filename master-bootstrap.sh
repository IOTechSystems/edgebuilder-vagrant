#!/usr/bin/env bash
VER=$1
CREDS=$2
export DEBIAN_FRONTEND=noninteractive

if [ "$CREDS" != "" ]; then
  CREDS="-r $CREDS"
fi
# Install ifconfig
apt-get install -y net-tools
apt-get update

# Install edgebuilder server components
sudo sh -c 'wget -O - https://raw.githubusercontent.com/IOTechSystems/edgebuilder-installer/'"$VER"'/edgebuilder-install.sh | sh -s - server '"$CREDS"


# Install edgebuilder cli
sudo sh -c 'wget -O - https://raw.githubusercontent.com/IOTechSystems/edgebuilder-installer/'"$VER"'/edgebuilder-install.sh | sh -s - cli '"$CREDS"
