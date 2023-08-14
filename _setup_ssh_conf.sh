#!/bin/sh

SSH_DIR_PATH=$HOME/.ssh

[ ! -d "${SSH_DIR_PATH}" ] && mkdir "${SSH_DIR_PATH}" && chmod 700 "${SSH_DIR_PATH}"

tee "${SSH_DIR_PATH}/config" <<EOF >/dev/null
Host *
    ServerAliveInterval 60
    ServerAliveCountMax 5
    AddKeysToAgent yes
    IdentitiesOnly yes

Include */config
EOF

exit 0
