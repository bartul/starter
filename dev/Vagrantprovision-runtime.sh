#!/usr/bin/env bash

# Refresh basics
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git -y
sudo apt-get install unzip -y
sudo apt-get install curl -y

echo "##### Install mono #####"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
sudo apt-get install mono-complete -y


echo "##### Install libuv #####"
sudo apt-get install -y automake libtool
curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | tar zxfv - -C /usr/local/src
cd /usr/local/src/libuv-1.4.2
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install
sudo rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
sudo ldconfig
