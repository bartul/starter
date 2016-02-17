#!/usr/bin/env bash

# Refresh basics
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install curl -y

echo "##### Install dotnet #####"
sudo sh -c 'echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/dotnet/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'    
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet=1.0.0.001331-1
