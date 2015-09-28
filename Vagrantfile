# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.hostname = "starter"

  config.vm.box = "box-cutter/ubuntu1404-desktop"
  config.vm.provision "shell" do |s|
    s.path = "Vagrantprovision-runtime.sh"
  end
  config.vm.provision "shell" do |s|
    s.path = "Vagrantprovision-usertools.sh"
    s.privileged = false
  end
end
