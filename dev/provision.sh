#!/usr/bin/env bash

# Refresh basics
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git -y
sudo apt-get install unzip -y
sudo apt-get install curl -y

# Install mono
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
sudo apt-get install mono-complete -y
set MONO_THREADS_PER_CPU 2000

# Install libtool
echo "##### Install libtool #####"
sudo apt-get install -y automake libtool
curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | tar zxfv - -C /usr/local/src
cd /usr/local/src/libuv-1.4.2
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install
sudo rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
sudo ldconfig

# Install dnx
echo "##### Install dnx #####"
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh
source /home/vagrant/.dnx/dnvm/dnvm.sh
dnvm install latest


# Install atom
echo "##### Install atom #####"
curl -sSL https://github.com/atom/atom/releases/download/v1.0.19/atom-amd64.deb > ~/atom-amd64.deb
dpkg --install ~/atom-amd64.deb
rm ~/atom-amd64.deb
apm upgrade

# Install atom addins
echo "##### Install atom addins #####"
sudo -u vagrant apm install omnisharp-atom
sudo -u vagrant apm install ionide-installer
