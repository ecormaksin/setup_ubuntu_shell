#!/usr/bin/env bash

dpkg -l git && sudo apt -qq purge git
dpkg -l git-all || sudo apt -qq install git-all

exit 0
