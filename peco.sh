#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+peco" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt-get -qq update >/dev/null
DEBIAN_FRONTEND=noninteractive sudo apt-get -qq install peco >/dev/null

exit 0
