#!/bin/sh

TARGET_LOCALE=ja_JP.UTF-8

dpkg -l | grep -E "^ii( )+language-pack-ja" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt -y install language-pack-ja
fi

localectl status | grep "${TARGET_LOCALE}" >/dev/null
if [ $? -ne 0 ]; then
    sudo localectl --no-convert set-locale LANG="${TARGET_LOCALE}"
    . ~/.bash_profile
fi

exit 0
