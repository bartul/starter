#!/usr/bin/env bash

# Install dnx
echo "##### Install dnx #####"
export MONO_THREADS_PER_CPU=2000
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh
source ~/.dnx/dnvm/dnvm.sh
dnvm install latest -f -y
dnvm install latest -f -y -r coreclr

# Install atom
echo "##### Install atom #####"
curl -sSL https://github.com/atom/atom/releases/download/v1.0.19/atom-amd64.deb > ~/atom-amd64.deb
sudo dpkg --install ~/atom-amd64.deb
rm ~/atom-amd64.deb
apm upgrade

# Install atom addins
echo "##### Install atom addins #####"
apm install omnisharp-atom
# apm install ionide-installer
