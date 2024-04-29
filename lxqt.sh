#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+lxqt" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt-get -y install debconf debconf-utils sddm
sudo sh -c "echo '/usr/sbin/sddm' > /etc/X11/default-display-manager"
sudo sh -c "DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true dpkg-reconfigure sddm"
sudo sh -c "echo set shared/default-x-display-manager sddm | debconf-communicate"
sudo apt-get -y update
sudo sh -c "DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get -y install lxqt fonts-noto"
