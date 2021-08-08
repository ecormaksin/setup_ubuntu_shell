#!/bin/sh

cd `dirname $0`

PACKAGE_NAME=vim
SHELL_RC_FILE_PATH=$HOME/.bashrc
VIM_ALIAS_STRING="alias vi='vim'"

sudo cp -f ./vimrc/vimrc /etc/vim/vimrc.local

cat "${SHELL_RC_FILE_PATH}" | grep "${VIM_ALIAS_STRING}" >/dev/null
if [ $? -ne 0 ]; then
    echo -n "\n" >> "${SHELL_RC_FILE_PATH}"
    echo "${VIM_ALIAS_STRING}" >> "${SHELL_RC_FILE_PATH}"
fi

. "${SHELL_RC_FILE_PATH}"

sudo apt list --installed | grep "${PACKAGE_NAME}" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install "${PACKAGE_NAME}"

exit 0
