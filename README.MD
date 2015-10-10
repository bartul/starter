# Starter
a good place to start a project. Sort of a template for [dnx](https://github.com/aspnet/dnx) projects.
Or just use [yeoman](http://yeoman.io/) if you find this too ugly for your taste ;)

## Build Status
|         |Linux   |Windows |
|---------|:------:|:------:|
|master   |[![Travis](https://travis-ci.org/bartul/starter.svg?branch=master)](https://travis-ci.org/bartul/starter)|[![AppVeyor](https://ci.appveyor.com/api/projects/status/p69ypk73y1t32k86/branch/master?svg=true)](https://ci.appveyor.com/project/BartulB/starter/branch/master)|

## Development environment
Install [vagrant](https://www.vagrantup.com/downloads.html) and execute following commands in repository root:
```
cd dev
vagrant up
```
This will create virtual machine with simulated environment suitable for local development, with host repository folder synced at `/src`.

To start application execute following:
```
vagrant ssh
cd /vagant
./start.sh
```
