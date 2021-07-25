#!/bin/sh

PACKAGE_NAME=ansible

sudo apt list --installed | grep "${PACKAGE_NAME}" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt -y install "${PACKAGE_NAME}"

exit 0
