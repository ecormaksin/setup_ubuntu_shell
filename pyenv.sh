#!/bin/sh

which pyenv >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

curl https://pyenv.run | bash

for FILE_PATH in "${HOME}/.bashrc" "${HOME}/.profile" "${HOME}/.bash_profile" "${HOME}/.bash_login"
do
    if [ ! -e "${FILE_PATH}" ]; then
        continue
    fi

    echo ''
    echo "${FILE_PATH}"
    echo ''

    cat "${FILE_PATH}" | grep 'PYENV_ROOT' >/dev/null
    GREP_RESULT=$?
    if [ $GREP_RESULT -eq 0 ]; then
        continue
    fi

    echo '' >> "${FILE_PATH}"
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "${FILE_PATH}"
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> "${FILE_PATH}"
    echo 'eval "$(pyenv init -)"' >> "${FILE_PATH}"
    . "${FILE_PATH}"

done

sudo apt -y update; sudo apt -y install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

pyenv install 3.11.4
pyenv global 3.11.4

exec $SHELL -l

exit 0
