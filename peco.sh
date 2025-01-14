#!/usr/bin/env bash

curl -L -o /tmp/peco_linux_amd64.tar.gz https://github.com/peco/peco/releases/download/v0.5.11/peco_linux_amd64.tar.gz

tar -xzf /tmp/peco_linux_amd64.tar.gz -C /tmp

sudo mv /tmp/peco_linux_amd64/peco /usr/local/bin/
