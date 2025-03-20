#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+tmux" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install tmux
fi

curl --output ~/.tmux.conf --silent https://raw.githubusercontent.com/ecormaksin/tmux_conf/main/.tmux.conf
