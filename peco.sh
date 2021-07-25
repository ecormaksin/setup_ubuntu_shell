#!/bin/sh

PACKAGE_NAME=peco

sudo apt list --installed | grep "${PACKAGE_NAME}" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install "${PACKAGE_NAME}"

exit 0
