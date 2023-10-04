#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+meld" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -qq update >/dev/null
    sudo apt-get -qq install meld >/dev/null
fi

exit 0
