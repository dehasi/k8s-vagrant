# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant multi-machine sample setup

GB = 1024
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provision "setup /etc/hosts", :type => "shell", :path => "scripts/0-setup-etc-hosts.sh"
  config.vm.provision "setup containerd.conf", :type => "shell", :path => "scripts/1-setup-containerd-conf.sh"
  config.vm.provision "setup kubernetes-cri.conf", :type => "shell", :path => "scripts/2-setup-kubernetes-cri-conf.sh"
  config.vm.provision "install containerd", :type => "shell", :path => "scripts/3-install-containerd.sh"
  config.vm.provision "install kubernetes packages", :type => "shell", :path => "scripts/4-install-kubernetes-packages.sh"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 3*GB
    vb.cpus = 2
  end

  config.vm.define "control-pane" do |master|
    master.vm.network :private_network, ip: "10.0.0.2"
    master.vm.hostname = "control-pane"
    master.vm.provision "init kubernetes control pane", :type => "shell", :path => "init-kubernetes-control-pane.sh"
  end

  config.vm.define "worker-1" do |node|
    node.vm.network :private_network, ip: "10.0.0.3"
    node.vm.hostname = "worker-1"
  end

  config.vm.define "worker-2" do |node|
    node.vm.network :private_network, ip: "10.0.0.4"
    node.vm.hostname = "worker-2"
  end
end
