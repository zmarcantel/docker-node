# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu-precise"
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    config.vm.network :private_network, ip: "192.168.100.50"

    # plugin conflict
    # if Vagrant.has_plugin?("vagrant-vbguest") then
    #     config.vbguest.auto_update = false
    # end

    config.vm.provider "virtualbox" do |v|
        v.name = "node-latest"
        v.customize ["modifyvm", :id, "--memory", 2048]
    end

    config.vm.provision "docker" do |d|
        d.build_image "/vagrant",
          args: '-t "node-latest"'
    end
end
