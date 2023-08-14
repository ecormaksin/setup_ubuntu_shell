#!/bin/sh

cd `dirname $0`

BASH_ALIASES_FILE_PATH=$HOME/.bash_aliases
VIM_ALIAS_STRING="alias vi='vim'"

sudo cp -f ./vimrc/vimrc /etc/vim/vimrc.local

[ ! -e "${BASH_ALIASES_FILE_PATH}" ] && touch "${BASH_ALIASES_FILE_PATH}"

cat "${BASH_ALIASES_FILE_PATH}" | grep "${VIM_ALIAS_STRING}" >/dev/null
if [ $? -ne 0 ]; then
    echo "" >> "${BASH_ALIASES_FILE_PATH}"
    echo "${VIM_ALIAS_STRING}" >> "${BASH_ALIASES_FILE_PATH}"
fi

. "${BASH_ALIASES_FILE_PATH}"

dpkg -l | grep -E "^ii( )+vim" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install vim

exit 0
