#!/usr/bin/env bash

# Refresh basics

export DNX_VERSION=1.0.0-rc1-final
export DNX_USER_HOME=/opt/DNX_BRANCH
export DNX_RUNTIME_ID=ubuntu.14.04-x64

echo "##### Install dnx #####"
sudo apt-get -qq update 
sudo apt-get -qqy install unzip curl libicu-dev libunwind8 gettext libssl-dev libcurl3-gnutls zlib1g
sudo rm -rf /var/lib/apt/lists/*

sudo curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_USER_HOME=$DNX_USER_HOME DNX_BRANCH=v$DNX_VERSION sh
sudo bash -c "source $DNX_USER_HOME/dnvm/dnvm.sh \
	&& dnvm install $DNX_VERSION -alias default -r coreclr \
	&& dnvm alias default | xargs -i ln -s $DNX_USER_HOME/runtimes/{} $DNX_USER_HOME/runtimes/default"

echo "##### Install libuv #####"
LIBUV_VERSION=1.4.2
sudo apt-get -qq update
sudo apt-get -qqy install autoconf automake build-essential libtool
sudo curl -sSL https://github.com/libuv/libuv/archive/v${LIBUV_VERSION}.tar.gz | tar zxfv - -C /usr/local/src
cd /usr/local/src/libuv-$LIBUV_VERSION
sudo sh autogen.sh && ./configure && make && make install
sudo rm -rf /usr/local/src/libuv-$LIBUV_VERSION
sudo ldconfig
sudo apt-get -y purge autoconf automake build-essential libtool
sudo apt-get -y autoremove
sudo apt-get -y clean
sudo rm -rf /var/lib/apt/lists/*

export PATH=$PATH:$DNX_USER_HOME/runtimes/default/bin
export MONO_THREADS_PER_CPU=50