#!/usr/bin/env bash

which sdk >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

dpkg -l | grep -E "^ii( )+zip" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt -y update
    sudo apt -y install zip
fi

dpkg -l | grep -E "^ii( )+unzip" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt -y update
    sudo apt -y install unzip
fi

curl -s "https://get.sdkman.io" | bash

. ~/.profile
. "/home/$USER/.sdkman/bin/sdkman-init.sh"

sdk install java 17.0.8-librca

exit 0
