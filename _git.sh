#!/usr/bin/env bash

dpkg -l git && sudo apt-get -y purge git
dpkg -l git-all || sudo apt-get -y install git-all

exit 0
