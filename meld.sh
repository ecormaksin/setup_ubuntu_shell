#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+meld" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install meld
fi
