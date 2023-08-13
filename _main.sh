#!/bin/sh

cd `dirname $0`; ./lang_ja.sh
cd `dirname $0`; ./customize_ps.sh
cd `dirname $0`; ./vim.sh
cd `dirname $0`; ./golang.sh
cd `dirname $0`; ./ghq.sh
cd `dirname $0`; ./peco.sh
cd `dirname $0`; ./ghq-peco-alias.sh
cd `dirname $0`; ./pyenv.sh
cd `dirname $0`; ./nvm.sh
cd `dirname $0`; ./sdkman.sh

exec $SHELL -l
