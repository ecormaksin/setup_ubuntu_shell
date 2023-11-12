#!/usr/bin/env bash

SSH_DIR_PATH=$HOME/.ssh

[ ! -d "${SSH_DIR_PATH}" ] && mkdir "${SSH_DIR_PATH}" && chmod 700 "${SSH_DIR_PATH}"

tee "${SSH_DIR_PATH}/config" <<EOF >/dev/null
Include */config

Host *
    ServerAliveInterval 60
    ServerAliveCountMax 5
    AddKeysToAgent yes
    IdentitiesOnly yes
EOF
