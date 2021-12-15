# Edge Builder Vagrant
This repo holds Vagrant script to create and provision a number of VMs (based on Ubuntu 20.04) to demo Edge Builder:
   - A master node for running Edge Builder Server Components and CLI.
   - A number of edge nodes for running Edge Builder Node Components.

## Prerequisites
   - Install [VirtualBox](https://www.virtualbox.org/)
   - Install [Vagrant](https://www.vagrantup.com/)
   - Install Guest Additions for VirtualBox to enable file sharing between the host machine and the VMs:
      - `$ vagrant plugin install vagrant-vbguest`
   - Clone this repo:
      - `$ git clone https://github.com/IOTechSystems/edgebuilder-vagrant.git`
      - `$ cd edgebuilder-vagrant`
   - By default, Vagrant shares your project directory (the one containing the Vagrantfile) to the `/vagrant` directory in VM machines. 
     Download the Edge Builder install script from [here](https://github.com/IOTechSystems/edgebuilder-installer/blob/master/edgebuilder-install.sh) 
     And copy over the `edgebuilder-install.sh` file inside the Vagrant project directory:
      - `edgebuilder-vagrant/edgebuilder-install.sh`
     
     **Note** - The version of Edge Builder installed is hardcoded in the install script. So ensure you checj
     out the correct version of install script.

## Create the VMs using Vagrant
   - To bring the VMs up: 
      - `$ vagrant up`
   - SSH nodes using vagrant CLI: 
      - `$ vagrant ssh master`
      - `$ vagrant ssh node1`
   - You could also SSH the nodes from your host machine using the default username/password `vagrant/vagrant`:
      - `$ ssh vagrant@192.168.56.10  # master`
      - `$ ssh vagrant@192.168.56.11  # node1`
   - To bring the VMs down: 
      - `$ vagrant destroy -f`
