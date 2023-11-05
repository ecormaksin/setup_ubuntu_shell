#!/usr/bin/env bash

which sdk >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

dpkg -l | grep -E "^ii( )+zip" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install zip
fi

dpkg -l | grep -E "^ii( )+unzip" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install unzip
fi

curl -s "https://get.sdkman.io" | bash

. ~/.profile
. "/home/$USER/.sdkman/bin/sdkman-init.sh"

SDKMAN_CONF_FILE_PATH=~/.sdkman/etc/config
if [ -e "${SDKMAN_CONF_FILE_PATH}" ]; then
    sed -i "s/^sdkman_auto_answer=/sdkman_auto_answer=true/" "${SDKMAN_CONF_FILE_PATH}"
    sed -i "s/^sdkman_auto_env=/sdkman_auto_env=true/" "${SDKMAN_CONF_FILE_PATH}"
fi

for VERSION_NAME in 11.0.21-librca 17.0.9-librca 17.0.9-graalce 21-graalce
do
    sdk install java $VERSION_NAME
done

exit 0
