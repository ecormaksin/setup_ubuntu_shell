#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+tzdata" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -qq update >/dev/null
    DEBIAN_FRONTEND=noninteractive sudo apt-get -qq install tzdata >/dev/null
fi

sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo dpkg-reconfigure -f noninteractive tzdata

exit 0
