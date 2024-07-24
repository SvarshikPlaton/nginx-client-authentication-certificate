# -*- mode: ruby -*-
# vi: set ft=ruby :

# Start generate_ssl.sh first to generate the certificates
# then run the Vagrantfile

Vagrant.configure("2") do |config|
  config.vm.define "oracle-linux" do |oracle|
    oracle.vm.box = "generic/oracle9"
    oracle.vm.hostname = "oracle-linux"
    oracle.vm.network "private_network", ip: "192.168.56.101"
    oracle.vm.network "forwarded_port", guest: 443, host: 443
    oracle.vm.provision "shell", path: "nginx_setup.sh"
    oracle.vm.provision "file", source: "./certs/ca.crt", destination: "/etc/nginx/ssl/certs/ca.crt"
    oracle.vm.provision "file", source: "./certs/ca.key", destination: "/etc/nginx/ssl/certs/ca.key"
    oracle.vm.provision "shell", path: "post_actions.sh"
  end
end
