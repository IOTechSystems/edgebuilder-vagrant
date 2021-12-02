#!/usr/bin/env bash
VER=$1
CREDS=$2
export DEBIAN_FRONTEND=noninteractive

if [ $CREDS != "" ]; then
  CREDS="-r $CREDS"
fi
# Install ifconfig
apt-get install -y net-tools

# Install edgebuilder server components
sudo sh -c 'wget -O - https://raw.githubusercontent.com/IOTechSystems/edgebuilder-installer/'"$VER"'/edgebuilder-install.sh | sh -s - node '"$CREDS"

# Required to run a simple webserver for App Definition
mkdir /home/vagrant/src
echo "I am edge $HOSTNAME" > /home/vagrant/src/index.html
