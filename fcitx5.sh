#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+fcitx5" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y install zenity fcitx5 fcitx5-mozc fcitx5-config-qt fcitx5-frontend-all fcitx5-frontend-fbterm fcitx5-frontend-gtk2 fcitx5-frontend-gtk3 fcitx5-frontend-gtk4 fcitx5-frontend-qt5 fcitx5-frontend-qt6 fcitx5-frontend-tmux im-config
fi

im-config -n fcitx5
