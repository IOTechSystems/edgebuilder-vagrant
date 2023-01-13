# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrant box available: https://app.vagrantup.com/bento/boxes/ubuntu-20.04
BASE_IMAGE = "bento/ubuntu-20.04"
BOX_VERSION = "202012.23.0"
EB_COMPONENT_VER = "v2.1.0.rc1.intel"
EB_REPO_CREDS = ""

# Number of (Edge) nodes
node_count = 1
if ENV['NODE_COUNT']
  node_count = ENV['NODE_COUNT'].to_i
end

if ENV['EB_COMPONENT_VER']
  EB_COMPONENT_VER = ENV['EB_COMPONENT_VER'].to_s
end

if ENV['EB_REPO_CREDS']
  EB_REPO_CREDS = ENV['EB_REPO_CREDS'].to_s
end

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Create a master node
  config.vm.define "master" do |subconfig|
    # Set base image
    subconfig.vm.box = BASE_IMAGE
    subconfig.vm.box_version = BOX_VERSION

    # Set hostname
    subconfig.vm.hostname = "master"

    # Setting up private_network to have virtual host
    subconfig.vm.network :private_network, ip: "192.168.56.10"
    subconfig.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
    # Provision VMs using a provision (shell) script
    subconfig.vm.provision "shell" do |s|
      s.path = "master-bootstrap.sh"
      s.args = [EB_COMPONENT_VER, EB_REPO_CREDS]
    end
  end

  # Create 'n' (Edge) nodes
  (1..node_count).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      # Set base image
      subconfig.vm.box = BASE_IMAGE
      subconfig.vm.box_version = BOX_VERSION

      # Set hostname
      subconfig.vm.hostname = "node#{i}"

      # Setting up private_network to have virtual host
      subconfig.vm.network :private_network, ip: "192.168.56.#{i + 10}"

      # Provision VMs using a provision (shell) script
      subconfig.vm.provision "shell" do |s|
        s.path = "node-bootstrap.sh"
        s.args = [EB_COMPONENT_VER, EB_REPO_CREDS]
      end
    end
  end

  # Enable SSH forward agent
  config.ssh.forward_agent = true

  # The time (in sec) that Vagrant will wait for the machine to boot
  config.vm.boot_timeout = 1200
end
