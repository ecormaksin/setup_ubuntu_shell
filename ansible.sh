#!/bin/sh

which ansible >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

pip list | grep ansible >/dev/null
if [ $? -eq 0 ]; then
    python -m pip install --upgrade --user ansible
else
    python -m pip install --user ansible
fi

. ~/.profile

exit 0
