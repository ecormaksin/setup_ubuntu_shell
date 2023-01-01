#!/bin/sh

cd `dirname $0`; ./lang_ja.sh
cd `dirname $0`; ./customize_ps.sh
cd `dirname $0`; ./vim.sh
cd `dirname $0`; ./ssh-settings.sh
cd `dirname $0`; ./golang.sh
cd `dirname $0`; ./ghq.sh
cd `dirname $0`; ./peco.sh
cd `dirname $0`; ./ghq-peco-alias.sh

exec $SHELL -l
