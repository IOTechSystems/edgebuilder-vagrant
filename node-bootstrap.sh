#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Install ifconfig  
apt-get install -y net-tools

# Required to install SaltStack
wget -O - https://repo.saltstack.com/py3/ubuntu/20.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/py3/ubuntu/20.04/amd64/latest focal main" | sudo tee -a /etc/apt/sources.list.d/saltstack.list
sudo apt-get update

# Install edgebuilder node components
bash ./vagrant/edgebuilder-install.sh server

# Add vagrant to docker group
usermod -aG docker vagrant

# Required to run a simple webserver for App Definition
mkdir /home/vagrant/src
echo "I am edge $HOSTNAME" > /home/vagrant/src/index.html

