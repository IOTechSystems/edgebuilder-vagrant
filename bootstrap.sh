#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Install ifconfig  
apt-get install -y net-tools

# Install docker
apt-get install -y docker.io
usermod -aG docker vagrant

# Install docker-compose
apt-get install -y docker-compose

