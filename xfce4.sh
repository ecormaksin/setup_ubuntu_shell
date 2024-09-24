#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+xfce4" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt-get -y install debconf debconf-utils
sudo sh -c "echo '/usr/sbin/gdm3' > /etc/X11/default-display-manager"
sudo sh -c "DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true dpkg-reconfigure gdm3"
sudo sh -c "echo set shared/default-x-display-manager gdm3 | debconf-communicate"
sudo apt-get -y update
sudo sh -c "DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get -y install xfce4 xfce4-goodies fonts-noto"
