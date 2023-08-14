#!/bin/sh

BASH_PROFILE_FILE_PATH=$HOME/.bash_profile

[ ! -e "${BASH_PROFILE_FILE_PATH}" ] && touch "${BASH_PROFILE_FILE_PATH}"

for EXPORT_COMMAND in '. ~/.profile' '. ~/.bashrc'
do
    echo "${BASH_PROFILE_FILE_PATH}" | grep "${EXPORT_COMMAND}" >/dev/null
    GREP_RESULT=$?
    [ $GREP_RESULT -ne 0 ] && echo "${EXPORT_COMMAND}" >> "${BASH_PROFILE_FILE_PATH}"
done

exit 0
