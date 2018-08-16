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
#PS1="%{$fg[cyan]%}[${USER}@${HOST%%.*} %1~]%(!.#.$)${reset_color} "

#プロンプトの設定
PROMPT='[%F{cyan}%~%f]$ '


alias ll='ls -l'
alias la='ls -Al'
alias l='ls -CF'
alias sed="gsed"
alias d="docker"
alias doc="docker-compose"
alias readlink="greadlink"
alias chrm="open /Applications/Google\ Chrome.app"
#業務でよく使うので、、、、
alias aipo="open https://aipo.tmlab.jp/"
alias mtm="open /Applications/Mattermost.app"
alias g="git"
# --------------------------------------------------
#  $ tree でディレクトリ構成表示
# --------------------------------------------------

alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"


# --------------------------------------------------


source /usr/local/bin/aws_zsh_completer.sh

# --------------------------------------
# Google search from terminal
# --------------------------------------
ggl(){
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
        shift
    fi
    local url="https://www.google.co.jp/search?q=${*// /+}"
    local app="/Applications"
    local g="${app}/Google Chrome.app"
    local f="${app}/Firefox.app"
    local s="${app}/Safari.app"
    case ${opt} in
        "-g")   open "${url}" -a "$g";;
        "-f")   open "${url}" -a "$f";;
        "-s")   open "${url}" -a "$s";;
        *)      open "${url}";;
    esac
}

# --------------------------------------
# gitの補完強化
# --------------------------------------

 autoload -Uz compinit && compinit
# --------------------------------------
# gitのブランチ名表示
# --------------------------------------

function parse_git_branch {
  RED="\e[0;31m"
  YELLOW="\e[33m"
  GREEN="\e[0;32m"
  BLUE="\e[0;34m"
  NONE="\e[0m"

  NOW_BRANCH=$(git symbolic-ref HEAD 2> /dev/null | cut -d/ -f3)
  IND_STAT=$(git status --porcelain 2> /dev/null | grep -v "?" | cut -d" " -f1 )
  WTR_STAT=$(git status --porcelain 2> /dev/null | grep -v "?" | cut -d" " -f2 )

  if [ "${IND_STAT}" != "" ]; then
    [[ ${NOW_BRANCH} ]] && echo -e "${RED}[${NOW_BRANCH}]${NONE}"

  elif [ "${WTR_STAT}" != "" ]; then
    [[ ${NOW_BRANCH} ]] && echo -e "${YELLOW}[${NOW_BRANCH}]${NONE}"

  else
    [[ ${NOW_BRANCH} ]] && echo -e "${BLUE}[${NOW_BRANCH}]${NONE}"

  fi

}
