#!/usr/bin/env bash

which nix >/dev/null
if [ $? -ne 0 ]; then
    curl -L https://nixos.org/nix/install | sh -s -- --daemon
fi

dpkg -l | grep -E "^ii( )+direnv" >/dev/null
if [ $? -ne 0 ]; then
    sudo apt-get -y update
    sudo apt-get -y install direnv
fi

cat ~/.bashrc | grep "direnv hook bash" >/dev/null
[ $? -ne 0 ] && tee -a ~/.bashrc <<"EOF" >/dev/null

eval "$(direnv hook bash)"
EOF

export DIRENV_LOG_FORMAT=
