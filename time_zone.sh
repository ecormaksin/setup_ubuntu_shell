#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+tzdata" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt -y update
    sudo apt -y upgrade
    DEBIAN_FRONTEND=noninteractive sudo apt -y install tzdata
fi

sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo dpkg-reconfigure -f noninteractive tzdata

exit 0
