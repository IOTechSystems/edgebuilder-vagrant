# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrant box available: https://app.vagrantup.com/bento/boxes/ubuntu-20.04
BOX_IMAGE = "bento/ubuntu-20.04"

# Number of (Edge) nodes
node_count = 1
if ENV['NODE_COUNT']
  node_count = ENV['NODE_COUNT'].to_i  
end

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 

  # Set base image
  config.vm.box = BOX_IMAGE
 
  # Enable SSH forward agent
  config.ssh.forward_agent = true
  
  # The time (in sec) that Vagrant will wait for the machine to boot
  config.vm.boot_timeout = 600
  
  # Create a master node
  config.vm.define "master" do |subconfig|
  
    # Set hostname
    subconfig.vm.hostname = "master"
    
    # Setting up private_network to have virtual host
    subconfig.vm.network :private_network, ip: "192.168.33.10"
    
    # Provision VMs using a provision (shell) script
    subconfig.vm.provision :shell, path: "master-bootstrap.sh"
  end
  
  # Create 'n' (Edge) nodes
  (1..node_count).each do |i|
    config.vm.define "node#{i}" do |subconfig|
    
      # Set hostname
      subconfig.vm.hostname = "node#{i}"
    
      # Setting up private_network to have virtual host
      subconfig.vm.network :private_network, ip: "192.168.33.#{i + 10}"
    
      # Provision VMs using a provision (shell) script
      subconfig.vm.provision :shell, path: "node-bootstrap.sh"      
    end
  end
  
end
