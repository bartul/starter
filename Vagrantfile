# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.1.0"

Vagrant.configure(2) do |config|

  config.vm.hostname = "starter"
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "parallels" do |p, override|
    # Guest Tools are unavailable.
    p.check_guest_tools = false
    p.functional_psf    = false
    p.name = "starter"
  end

  config.vm.provision "shell" do |s|
    s.path = "Vagrantprovision-runtime.sh"
  end
  config.vm.provision "shell" do |s|
    s.path = "Vagrantprovision-usertools.sh"
    s.privileged = false
  end
end
