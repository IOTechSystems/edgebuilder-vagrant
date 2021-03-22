# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrant box available: https://app.vagrantup.com/bento/boxes/ubuntu-20.04
BOX_IMAGE = "bento/ubuntu-20.04"

# Number of (Edge) nodes
NODE_COUNT = 1

Vagrant.configure("2") do |config| 

  # Create a master node
  config.vm.define "master" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "master"
    
    # Setting up private_network to have virtual host
    subconfig.vm.network :private_network, ip: "192.168.33.10"
    
    # Provision VMs using a provision (shell) script
    subconfig.vm.provision :shell, path: "master-bootstrap.sh"
  end
  
  # Create 'n' (Edge) nodes
  (1..NODE_COUNT).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "node#{i}"
    
      # Setting up private_network to have virtual host
      subconfig.vm.network :private_network, ip: "192.168.33.#{i + 10}"
    
      # Provision VMs using a provision (shell) script
      subconfig.vm.provision :shell, path: "node-bootstrap.sh"      
    end
  end

  # Enable ssh forward agent
  config.ssh.forward_agent = true
end
