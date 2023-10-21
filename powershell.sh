#!/bin/sh

dpkg -l | grep -E "^ii( )+powershell" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

# https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.3

###################################
# Prerequisites

# Update the list of packages
sudo apt-get -y update

# Install pre-requisite packages.
sudo apt-get -y install wget apt-transport-https software-properties-common

# Get the version of Ubuntu
. /etc/os-release

# Download the Microsoft repository keys
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb

# Register the Microsoft repository keys
sudo dpkg -i packages-microsoft-prod.deb

# Delete the the Microsoft repository keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt-get -y update

###################################
# Install PowerShell
sudo apt-get -y install powershell

exit 0
