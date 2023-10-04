#!/usr/bin/env bash

TARGET_LOCALE=ja_JP.UTF-8

dpkg -l | grep -E "^ii( )+language-pack-ja" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -qq update >/dev/null
    DEBIAN_FRONTEND=noninteractive sudo apt-get -qq install language-pack-ja >/dev/null
fi

localectl status | grep "${TARGET_LOCALE}" >/dev/null
if [ $? -ne 0 ]; then
    sudo localectl --no-convert set-locale LANG="${TARGET_LOCALE}"
    . ~/.profile
fi

exit 0
