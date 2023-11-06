#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+xfce4" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y install debconf debconf-utils
    sudo sh -c "echo '/usr/sbin/gdm3' > /etc/X11/default-display-manager"
    sudo sh -c "DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true dpkg-reconfigure gdm3"
    sudo sh -c "echo set shared/default-x-display-manager gdm3 | debconf-communicate"
    sudo apt-get -y update
    sudo sh -c "DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get -y install xfce4 xfce4-goodies language-selector-common language-selector-gnome xdg-user-dirs-gtk fonts-noto fcitx5-mozc xrdp"
fi

# Configure the policy xrdp session
sudo tee /etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla <<EOF
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
EOF

# https://askubuntu.com/questions/1193810/authentication-required-to-refresh-system-repositories-in-ubuntu-19-10
sudo tee /etc/polkit-1/localauthority/50-local.d/46-allow-update-repo.pkla<<EOF
[Allow Package Management all Users]
Identity=unix-user:*
Action=org.freedesktop.packagekit.system-sources-refresh
ResultAny=yes
ResultInactive=yes
ResultActive=yes
EOF

im-config -n fcitx5

echo "xfce4-session" | tee ~/.xsession

exit 0
