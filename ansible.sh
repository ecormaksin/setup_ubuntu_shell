#!/bin/sh

which ansible >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

python -m pip install --user ansible

echo $PATH | grep '$HOME/.local/bin' >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

tee -a "$HOME/.bashrc" << "EOF" >/dev/null

echo $PATH | grep '$HOME/.local/bin' >/dev/null
if [ $? -ne 0 ];
    export PATH="$HOME/.local/bin:$PATH"
fi
EOF

. ~/.bashrc

exit 0
