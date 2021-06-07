#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Install ifconfig  
apt-get install -y net-tools
apt-get update

# Install edgebuilder server components
wget -q -O - https://github.com/IOTechSystems/edgebuilder-installer/archive/refs/tags/v0.9.1.tar.gz | tar xvz -C /vagrant/
. /vagrant/edgebuilder-installer-0.9.1/edgebuilder-install.sh server

# Add vagrant to docker group
usermod -aG docker vagrant

# Install edgebuilder cli
. /vagrant/edgebuilder-installer-0.9.1/edgebuilder-install.sh cli

