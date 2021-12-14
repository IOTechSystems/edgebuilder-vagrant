#!/usr/bin/env bash
VER=$1
CREDS=$2
export DEBIAN_FRONTEND=noninteractive

if [ "$CREDS" != "" ]; then
  CREDS="-r $CREDS"
fi

# Required to run a simple webserver for App Definition
mkdir /home/vagrant/src
echo "I am edge $HOSTNAME" > /home/vagrant/src/index.html
