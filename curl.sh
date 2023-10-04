#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+curl" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -qq update >/dev/null
    sudo apt-get -qq install curl >/dev/null
fi

exit 0
