#!/usr/bin/env bash

dpkg -l | grep -E "^ii( )+xrdp" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y install xrdp
fi

echo 'You need to configure ~/.xsession.'

# echo "xfce4-session" | tee ~/.xsession
# echo "startlxqt" | tee ~/.xsession
