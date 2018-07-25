#タブタイトルにカレントディレクトリのフォルダ名を表示
precmd () {
  echo -ne "\e]2;${PWD}\a"
  echo -ne "\e]1;${PWD:t}\a"
}


# 強力な補完を有効にする
autoload -Uz compinit
compinit

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

# cdを使わずにディレクトリを移動できる
setopt auto_cd

# $ cd - でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# カレントディレクトリの表示
PS1="%{$fg[cyan]%}[${USER}@${HOST%%.*} %1~]%(!.#.$)${reset_color} "

alias ll='ls -l'
alias la='ls -Al'
alias l='ls -CF'
alias sed="gsed"
alias dok="docker"
alias doc="docker-compose"
# --------------------------------------------------
#  $ tree でディレクトリ構成表示
# --------------------------------------------------

alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"

