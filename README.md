# Ubuntu シェルの初期設定

## _main.sh実行前の手動手順

- WSLの場合

  - `/etc/wsl.conf` に以下を追加する。

      ```text
      [boot]
      systemd=true

      [interop]
      appendWindowsPath = false
      ```

  - `~/.bash_aliases` に以下を追加する。

      ```text
      alias code='"/mnt/c/Users/<Windows側のユーザー>/AppData/Local/Programs/Microsoft VS Code/bin/code"'
      ```

  - Windows側でUbuntuをシャットダウンする。

      ```pwsh
      wsl --terminate "<ディストリビューション名>"
      ```

- `LANG=C xdg-user-dirs-update --force` を実行してホームディレクトリのフォルダ名を日本語から英語へ変更する。

- gitをインストールする。

  ```shell
  sh ./_git.sh
  ```

  ```shell
  git config --global user.name "<name>"
  git config --global user.email <email>
  ```

- `./_setup_ssh_conf.sh` を実行してssh用の設定フォルダーと基底ファイルを作成する

- `~/.ssh` へprivate鍵を配置し、`chmod 600 ~/.ssh/<private_key_file_name>` を実行する。

- `~/.ssh` へpublic鍵を配置し、`chmod 600 ~/.ssh/<public_key_file_name>` を実行する。

- `keychain` を使ってSSH接続のprivate鍵をログイン時に読み込ませる。
  （private鍵のアルゴリズムは `ed25519`、ファイル パスは `~/.ssh/id_ed25519` の想定）

  ```shell
  sudo apt-get -y install keychain

  EXPORT_COMMAND='eval `keychain --eval --agents ssh id_ed25519`'
  echo ~/.profile | grep "${EXPORT_COMMAND}" >/dev/null
  GREP_RESULT=$?
  [ $GREP_RESULT -ne 0 ] && echo -e "\n${EXPORT_COMMAND}" >> ~/.profile
  . ~/.profile
  ```

  ログイン時にパスフレーズ入力待ちでVagrantの仮想マシン上などで問題がある場合は、エイリアスを登録して手動で入力するなどで対応する。

  ```shell
  cat ~/.bash_aliases | grep keychain >/dev/null || echo "alias start-keychain='eval \`keychain --eval --agents ssh id_ed25519\`'" >> ~/.bash_aliases
  ```

## GUIで日本語入力する場合に必要な設定

- 日本語対応フォントのインストール

  ```shell
  sudo apt-get -y install fonts-noto
  ```

- 言語サポートのインストール

  ```shell
  sudo apt-get -y install language-selector-common language-selector-gnome
  ```

- fcitxの設定
  - WSLの場合、IBusで動かそうとしてもうまくいかなかった。

    <https://qiita.com/SoraKumo/items/f83548efde26788a1fc7>

    ```shell
    sudo apt-get -y update
    sudo apt-get -y install fcitx-bin fcitx-mozc dbus-x11 language-pack-ja
    sudo update-locale LANG=ja_JP.UTF8

    cat << EOS | sudo tee /etc/fonts/local.conf
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig><dir>/mnt/c/Windows/Fonts</dir></fontconfig>
    EOS

    cat << EOS >> ~/.profile
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    export DefaultIMModule=fcitx
    fcitx-autostart &> /dev/null
    EOS
    ```
