#!/usr/bin/env bash

which nix >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

curl -L https://nixos.org/nix/install | sh -s -- --daemon
