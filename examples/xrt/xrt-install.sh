#!bin/sh
sudo apt-get update && sudo apt-get install iotech-xrt-2.0=2.0.2 -y
mkdir -p /opt/iotech/xrt/2.0/deployment/config
echo "changed=yes"
exit 0
