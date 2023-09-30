#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+meld" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt -y update
    sudo apt -y install meld
fi

exit 0
