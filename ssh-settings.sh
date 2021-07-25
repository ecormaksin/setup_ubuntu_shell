#!/bin/sh

SSH_DIR_PATH=$HOME/.ssh

if [ ! -d "${SSH_DIR_PATH}" ]; then
    mkdir "${SSH_DIR_PATH}"
fi

tee "${SSH_DIR_PATH}/config" <<EOF >/dev/null
Host *
    ServerAliveInterval 60
    ServerAliveCountMax 5

Include */config
EOF