#!/usr/bin/env bash

echo "##### Install dnx #####"
export MONO_THREADS_PER_CPU=2000
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh
source ~/.dnx/dnvm/dnvm.sh
dnvm install latest -u -f -y -r coreclr
dnvm install latest -u -f -y

echo "##### Install node & npm #####"
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo npm install nodemon -g
