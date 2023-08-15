#!/bin/sh

dpkg -l | grep -E "^ii( )+curl" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt -y install curl
fi

exit 0
