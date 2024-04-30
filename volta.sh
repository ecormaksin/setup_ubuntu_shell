#!/usr/bin/env bash

which volta >/dev/null
if [ $? -ne 0 ]; then
    curl https://get.volta.sh | bash
fi

exec $SHELL -l

which node >/dev/null
if [ $? -ne 0 ]; then
    volta install node
fi

which npm >/dev/null
if [ $? -ne 0 ]; then
    volta install npm
fi
