#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Install ifconfig  
apt-get install -y net-tools
apt-get update

# Install edgebuilder server components
. /vagrant/edgebuilder-install.sh server

# Add vagrant to docker group
usermod -aG docker vagrant

# Install edgebuilder cli
. /vagrant/edgebuilder-install.sh cli

