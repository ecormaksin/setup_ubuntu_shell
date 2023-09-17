#!/bin/sh

which sdk >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

sudo apt -y install zip unzip

curl -s "https://get.sdkman.io" | bash

. ~/.profile
. "/home/$USER/.sdkman/bin/sdkman-init.sh"

sdk install java 17.0.8-librca

exit 0
