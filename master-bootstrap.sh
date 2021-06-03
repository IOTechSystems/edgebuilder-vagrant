#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Install ifconfig  
apt-get install -y net-tools

# Install docker
apt-get install -y docker.io
usermod -aG docker vagrant

# Install docker-compose
apt-get install -y docker-compose

sudo apt-get update

# Install edgebuilder server components
bash ./vagrant/edgebuilder-install.sh server

# Install edgebuilder cli
bash ./vagrant/edgebuilder-install.sh cli

