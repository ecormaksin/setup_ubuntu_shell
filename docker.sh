#!/usr/bin/env bash

for PKG_NAME in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc
do
    dpkg -l | grep -E "^ii( )+${PKG_NAME}" >/dev/null
    if [ $? -ne 0 ]; then
        continue
    fi

    sudo apt-get -y purge "${PKG_NAME}" >/dev/null
done

for PKG_NAME in ca-certificates curl gnupg
do
    dpkg -l | grep -E "^ii( )+${PKG_NAME}" >/dev/null
    if [ $? -eq 0 ]; then
        continue
    fi

    sudo apt-get -y update
    sudo apt-get -y install "${PKG_NAME}"
done

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update

for PKG_NAME in docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
do
    dpkg -l | grep -E "^ii( )+${PKG_NAME}"
    if [ $? -eq 0 ]; then
        continue
    fi

    sudo apt-get -y install "${PKG_NAME}"
done

sudo cat /etc/group | grep docker
if [ $? -ne 0 ]; then
    sudo groupadd docker
fi

sudo usermod -aG docker $USER

DOCKER_USER_DIR="${HOME}/.docker"

if [ -e "${DOCKER_USER_DIR}" ]; then
    sudo chown "$USER":"$USER" "${DOCKER_USER_DIR}" -R
    sudo chmod g+rwx "${DOCKER_USER_DIR}" -R
fi
