# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.hostname = "starter"

  config.vm.box = "ubuntu/vivid64" # Official Ubuntu Server 15.04 (Vivid Vervet)
  config.vm.provider "parallels" do |p, override|
    override.vm.box = "parallels/ubuntu-14.04"
  end

  config.vm.provision "shell" do |s|
    s.path = "Vagrantprovision-runtime.sh"
  end
  config.vm.provision "shell" do |s|
    s.path = "Vagrantprovision-usertools.sh"
    s.privileged = false
  end
end
