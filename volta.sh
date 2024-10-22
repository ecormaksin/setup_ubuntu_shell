#!/usr/bin/env bash

which volta >/dev/null
if [ $? -ne 0 ]; then
    curl https://get.volta.sh | bash
fi

VOLTA_BIN_PATH="${HOME}/.volta/bin/volta"

which node >/dev/null
if [ $? -ne 0 ]; then
    "${VOLTA_BIN_PATH}" install node
fi

which npm >/dev/null
if [ $? -ne 0 ]; then
    "${VOLTA_BIN_PATH}" install npm
fi
