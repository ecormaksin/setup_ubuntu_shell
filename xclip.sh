#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+xclip" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -qq update >/dev/null
    DEBIAN_FRONTEND=noninteractive sudo apt-get -qq install xclip >/dev/null
fi

BASH_ALIASES_FILE_PATH=$HOME/.bash_aliases
[ ! -e "${BASH_ALIASES_FILE_PATH}" ] && touch "${BASH_ALIASES_FILE_PATH}"

for ALIAS_STRING in "alias pbcopy='xclip -selection c'" "alias pbpaste='xclip -selection c -o'"
do
    cat "${BASH_ALIASES_FILE_PATH}" | grep "${ALIAS_STRING}" >/dev/null
    if [ $? -ne 0 ]; then
        echo "" >> "${BASH_ALIASES_FILE_PATH}"
        echo "${ALIAS_STRING}" >> "${BASH_ALIASES_FILE_PATH}"
    fi
done

. "${BASH_ALIASES_FILE_PATH}"

exit 0
