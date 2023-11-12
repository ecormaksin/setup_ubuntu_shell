#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+podman" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install podman
fi

PIP_LIST=`pip list -v`

for PKG_NAME in PyYAML python-dotenv podman-compose
do
    echo "${PIP_LIST}" | grep "${PKG_NAME}" >/dev/null
    if [ $? -eq 0 ]; then
        continue
    fi

    pip -q install "${PKG_NAME}"
done

dpkg -l | grep -E "^ii( )+containernetworking-plugins" >/dev/null
if [ $? -ne 0 ]; then
    curl -sfLO http://archive.ubuntu.com/ubuntu/pool/universe/g/golang-github-containernetworking-plugins/containernetworking-plugins_1.1.1+ds1-3build1_amd64.deb
    sudo dpkg -i containernetworking-plugins_1.1.1+ds1-3build1_amd64.deb
fi
