#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+openssh-server" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install openssh-server
fi

sudo sed -i "s/^#PermitRootLogin .*/PermitRootLogin no/" /etc/ssh/sshd_config

# sudo sed -i "s/^#PasswordAuthentication .*/PasswordAuthentication no/" /etc/ssh/sshd_config
