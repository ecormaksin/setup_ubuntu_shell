#!/usr/bin/env bash

dpkg -l git && sudo apt -y purge git
dpkg -l git-all || sudo apt -y install git-all

exit 0
