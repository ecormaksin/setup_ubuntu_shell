#!/usr/bin/env bash

which sdk >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

dpkg -l | grep -E "^ii( )+zip" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -qq update >/dev/null
    sudo apt-get -qq install zip >/dev/null
fi

dpkg -l | grep -E "^ii( )+unzip" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -qq update >/dev/null
    sudo apt-get -qq install unzip >/dev/null
fi

curl -s "https://get.sdkman.io" | bash

. ~/.profile
. "/home/$USER/.sdkman/bin/sdkman-init.sh"

sdk install java 21-graalce

exit 0
