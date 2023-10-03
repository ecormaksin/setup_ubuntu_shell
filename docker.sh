#!/usr/bin/env bash

for PKG_NAME in docker.io docker-doc docker-compose podman-docker containerd runc
do
    dpkg -l | grep -E "^ii( )+${PKG_NAME}" >/dev/null
    if [ $? -ne 0 ]; then
        continue
    fi

    sudo apt -y -q purge "${PKG_NAME}"
done

for PKG_NAME in ca-certificates curl gnupg
do
    dpkg -l | grep -E "^ii( )+${PKG_NAME}" >/dev/null
    if [ $? -eq 0 ]; then
        continue
    fi

    sudo apt -y -q update
    sudo apt -y -q install "${PKG_NAME}"
done

sudo install -m 0755 -d /etc/apt/keyrings

DOCKER_KEYRING_FILE=/etc/apt/keyrings/docker.gpg

if [ ! -e "${DOCKER_KEYRING_FILE}" ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o "${DOCKER_KEYRING_FILE}"
fi

sudo chmod a+r "${DOCKER_KEYRING_FILE}"

DOCKER_SOURCE_LIST=/etc/apt/sources.list.d/docker.list

if [ ! -e "${DOCKER_SOURCE_LIST}" ]; then
    echo \
        "deb [arch="$(dpkg --print-architecture)" signed-by="${DOCKER_KEYRING_FILE}"] https://download.docker.com/linux/ubuntu \
        "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
        sudo tee "${DOCKER_SOURCE_LIST}" > /dev/null
    sudo apt -y -q update
fi

for PKG_NAME in docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
do
    dpkg -l | grep -E "^ii( )+${PKG_NAME}" >/dev/null
    if [ $? -eq 0 ]; then
        continue
    fi

    sudo apt -y -q install "${PKG_NAME}"
done

sudo cat /etc/group | grep docker >/dev/null
if [ $? -ne 0 ]; then
    sudo groupadd docker
fi

sudo usermod -aG docker $USER
newgrp docker


DOCKER_USER_DIR="${HOME}/.docker"

if [ -e "${DOCKER_USER_DIR}" ]; then
    sudo chown "$USER":"$USER" "${DOCKER_USER_DIR}" -R
    sudo chmod g+rwx "${DOCKER_USER_DIR}" -R
fi

exit 0
