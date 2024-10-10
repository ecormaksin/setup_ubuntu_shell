#!/usr/bin/env bash

filename=$(echo $1 | sed -E 's/[ \t!]/_/g' | sed -E "s/['\?,]//g")

echo -n $filename | xclip -selection clipboard
echo $filename
