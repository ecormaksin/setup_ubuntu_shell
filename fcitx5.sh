#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+fcitx5" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y install zenity fcitx5 fcitx5-mozc
fi

im-config -n fcitx5
