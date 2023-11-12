#!/usr/bin/env bash

sudo apt-get -y update
dpkg -l git && sudo apt-get -y purge git
dpkg -l git-all || sudo apt-get -y install git-all
