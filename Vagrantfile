# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrant box available: https://app.vagrantup.com/bento/boxes/ubuntu-20.04
BOX_IMAGE = "bento/ubuntu-20.04"

# Number of nodes
NODE_COUNT = 2

Vagrant.configure("2") do |config| 
  # Create 'n' other nodes
  (1..NODE_COUNT).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "node#{i}"
      # Setting up private_network to have virtual host
      subconfig.vm.network :private_network, ip: "192.168.33.#{i + 10}"
    end
  end

  # Enable ssh forward agent
  config.ssh.forward_agent = true
  
  # Provision VMs using a provision (shell) script
  # Note: 'bootstrap.sh' is placed in the same directory as your Vagrantfile
  config.vm.provision :shell, path: "bootstrap.sh"
end
