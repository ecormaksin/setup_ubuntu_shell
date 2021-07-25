#!/bin/sh

SHELL_RC_FILE_PATH=$HOME/.bashrc
PACKAGE_NAME=language-pack-ja
EXPORT_STRING="export LANG=ja_JP.UTF-8"

sudo apt list --installed | grep "${PACKAGE_NAME}" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt -y install "${PACKAGE_NAME}"
fi

cat "${SHELL_RC_FILE_PATH}" | grep "${EXPORT_STRING}" >/dev/null
if [ $? -ne 0 ]; then
    echo -n "\n" >> "${SHELL_RC_FILE_PATH}"
    echo "${EXPORT_STRING}" >> "${SHELL_RC_FILE_PATH}"
fi

. "${SHELL_RC_FILE_PATH}"

exit 0
