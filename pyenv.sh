#!/usr/bin/env bash

which pyenv >/dev/null
if [ $? -eq 0 ]; then
    exit 0
fi

curl -sfL https://pyenv.run | bash

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

sudo apt-get -y update; sudo apt-get -y install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

. ~/.profile

pyenv install 3.12.9
pyenv global 3.12.9
