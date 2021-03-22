# Edge Builder Vagrant
This repo holds Vagrant script to create and provision a number of VMs (based on Ubuntu 20.04) to demo Edge Builder

## Prerequisites
   - Install VirtualBox [link](https://www.virtualbox.org/)
   - Install Vagrant [link](https://www.vagrantup.com/)
   - Install Guest Additions for VirtualBox to enable file sharing between the host machine and the VMs:
      - `$ vagrant plugin install vagrant-vbguest`

## Create the VMs using Vagrant
   - To bring the VMs up: 
      - `$ vagrant up`
   - SSH nodes using vagrant CLI: 
      - `$ vagrant ssh node1`
      - `$ vagrant ssh node2`
   - You could also SSH the nodes from your host machine using the deafult username/password `vagrant/vagrant`:
      - `~/vagrant/Ubuntu_20_04$ ssh vagrant@192.168.33.11  # node1`
      - `~/vagrant/Ubuntu_20_04$ ssh vagrant@192.168.33.12  # node2`
   - To bring the VMs down: 
      - `$ vagrant destroy -f`
