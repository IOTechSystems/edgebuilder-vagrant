#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Install ifconfig  
apt-get install -y net-tools
sudo apt-get update

# Install edgebuilder server components
bash ./vagrant/edgebuilder-install.sh server

# Add vagrant to docker group
usermod -aG docker vagrant

# Install edgebuilder cli
bash ./vagrant/edgebuilder-install.sh cli

