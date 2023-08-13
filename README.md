# Ubuntu シェルの初期設定

## _main.sh実行前の手動手順

- `_setup_ssh_conf.sh` を実行してssh用の設定フォルダーと基底ファイルを作成する

- `~/.ssh` へprivate鍵を配置し、`chmod 600 ~/.ssh/<private_key_file_name>` を実行する。

- `keychain` を使ってSSH接続のprivate鍵をログイン時に読み込ませる。
  （private鍵のアルゴリズムは `ed25519`、ファイル パスは `~/.ssh/id_ed25519` の想定）

  ```shell
  sudo apt -y install keychain

  EXPORT_COMMAND='eval `keychain --eval --agents ssh id_ed25519`'
  echo ~/.bash_profile | grep "${EXPORT_COMMAND}" >/dev/null
  GREP_RESULT=$?
  [ $GREP_RESULT -ne 0 ] && echo "${EXPORT_COMMAND}" >> ~/.bash_profile
  . ~/.bash_profile
  ```
