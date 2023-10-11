#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+vim" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install vim
fi

curl --output ~/.tmux.conf --silent https://raw.githubusercontent.com/ecormaksin/tmux_conf/main/.tmux.conf

exit 0
