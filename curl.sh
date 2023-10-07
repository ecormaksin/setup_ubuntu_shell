#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+curl" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install curl
fi

exit 0
