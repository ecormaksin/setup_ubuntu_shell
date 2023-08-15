#!/bin/sh

cd `dirname $0`

BASH_ALIASES_FILE_PATH=$HOME/.bash_aliases
VIM_ALIAS_STRING="alias vi='vim'"

sudo curl --output /etc/vim/vimrc.local --silent https://raw.githubusercontent.com/ecormaksin/vimrc/main/vimrc

[ ! -e "${BASH_ALIASES_FILE_PATH}" ] && touch "${BASH_ALIASES_FILE_PATH}"

cat "${BASH_ALIASES_FILE_PATH}" | grep "${VIM_ALIAS_STRING}" >/dev/null
if [ $? -ne 0 ]; then
    echo "" >> "${BASH_ALIASES_FILE_PATH}"
    echo "${VIM_ALIAS_STRING}" >> "${BASH_ALIASES_FILE_PATH}"
    . "${BASH_ALIASES_FILE_PATH}"
fi

dpkg -l | grep -E "^ii( )+vim" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt -y install vim
fi

exit 0
