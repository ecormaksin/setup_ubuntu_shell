#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+xfce4" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt -y update
    sudo apt -y -q install xfce4 xfce4-goodies fonts-noto fcitx5-mozc xrdp
fi

exit 0
