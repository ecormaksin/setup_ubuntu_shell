#!/usr/bin/env bash

SHELL_RC_FILE_PATH=$HOME/.bashrc

which volta >/dev/null
if [ $? -ne 0 ]; then
    curl https://get.volta.sh | bash
fi

. "${SHELL_RC_FILE_PATH}"

which node >/dev/null
if [ $? -ne 0 ]; then
    volta install node
fi

which npm >/dev/null
if [ $? -ne 0 ]; then
    volta install npm
fi
