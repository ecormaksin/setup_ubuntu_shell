#!/bin/sh

which ansible >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

python -m pip install --user ansible

. ~/.bash_profile

exit 0
