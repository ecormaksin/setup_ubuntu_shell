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
[ ! -e "${SDKMAN_CONF_FILE_PATH}" ] && \
cat << EOS > "${SDKMAN_CONF_FILE_PATH}"
sdkman_auto_answer=false
sdkman_colour_enable=true
sdkman_auto_env=true
sdkman_auto_complete=true
EOS

for VERSION_NAME in 21-graalce 17.0.9-graalce 17.0.9-librca 11.0.21-librca
do
    sdk install java $VERSION_NAME
done

exit 0
