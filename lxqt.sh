#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+lxqt" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt-get -y install lxqt
