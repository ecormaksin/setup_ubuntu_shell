#!/bin/sh

SHELL_RC_FILE_PATH=$HOME/.bashrc

cat "${SHELL_RC_FILE_PATH}" | grep -E "^alias gp='cd \\$\(ghq root\)/\\$\(ghq list \| peco\)'$" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

echo 'alias gp='\''cd $(ghq root)/$(ghq list | peco)'\' >> "${SHELL_RC_FILE_PATH}"
. "${SHELL_RC_FILE_PATH}"

exit 0
