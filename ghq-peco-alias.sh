#!/bin/sh

BASH_ALIASES_FILE_PATH=$HOME/.bash_aliases

cat "${BASH_ALIASES_FILE_PATH}" | grep -E "^alias gp='cd \\$\(ghq root\)/\\$\(ghq list \| peco\)'$" >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

echo '' >> "${BASH_ALIASES_FILE_PATH}"
echo 'alias gp='\''cd $(ghq root)/$(ghq list | peco)'\' >> "${BASH_ALIASES_FILE_PATH}"
. "${BASH_ALIASES_FILE_PATH}"

exit 0
