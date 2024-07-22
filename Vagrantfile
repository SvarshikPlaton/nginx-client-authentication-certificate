# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  Vagrant.configure("2") do |config|
    config.vm.define "oracle-linux" do |oracle|
      oracle.vm.box = "generic/oracle9"
      oracle.vm.hostname = "oracle-linux"
      oracle.vm.network "private_network", ip: "192.168.56.101"
      oracle.vm.network "forwarded_port", guest: 80, host: 80
      #oracle.vm.provision "shell", path: "install.sh"
    end
end
