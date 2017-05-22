# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.define "es01" do |es01|
    es01.vm.box = "KptnKMan/bluefhypervalphacentos7repack"
    es01.vm.provider "hyperv"
    es01.vm.hostname = "es01"
    es01.vm.network "public_network"
    es01.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
  end

  config.vm.define "es02" do |es02|
    es02.vm.box = "KptnKMan/bluefhypervalphacentos7repack"
    es02.vm.provider "hyperv"
    es02.vm.hostname = "es02"
    es02.vm.network "public_network"
    es02.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
  end

  config.vm.define "es03" do |es03|
    es03.vm.box = "KptnKMan/bluefhypervalphacentos7repack"
    es03.vm.provider "hyperv"
    es03.vm.hostname = "es03"
    es03.vm.network "public_network"
    es03.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
  end

  config.vm.provider "hyperv" do |hv|
     hv.cpus = 1
     hv.memory = 2048
     hv.ip_address_timeout = 240
  end
end
