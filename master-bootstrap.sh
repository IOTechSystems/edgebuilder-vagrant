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
apt-get install -y /vagrant/edgebuilder-server-0.9.0-dev_amd64.deb

# Install edgebuilder cli
apt-get install -y /vagrant/edgebuilder-cli-0.9.0-dev_amd64.deb

