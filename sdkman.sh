#!/bin/sh

which sdk >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt -y install zip unzip

curl -s "https://get.sdkman.io" | bash

exec $SHELL -l

exit 0
