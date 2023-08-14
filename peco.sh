#!/bin/sh

dpkg -l | grep -E "^ii( )+peco" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install peco

exit 0
