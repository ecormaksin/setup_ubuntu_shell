#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+tzdata" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install tzdata
fi

sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo dpkg-reconfigure -f noninteractive tzdata

exit 0
