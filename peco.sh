#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+peco" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt-get -y update
sudo apt-get -y install peco

exit 0
