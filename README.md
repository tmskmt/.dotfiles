dotfiles

vim +lua推奨
確認方法
 vim --version | grep lua

$ # インストール
$ brew install vim --with-lua

既存のvimのアンインストール
brew uninstall vim

をbashrcとかに書いとくとパスがいい感じになる
export PATH="/usr/local/bin:$PATH"
