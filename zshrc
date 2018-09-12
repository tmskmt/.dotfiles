# zplug settings(Homebrew)
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
# zplug settings(git)
#source ~/.zplug/init.zsh

# --------------------------------------
# POWERLEVEL9K設定
# --------------------------------------

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_MODE='nerdfont-complete'

# --------------------------------------
# プラグインマネージャー設定（zplug）
# --------------------------------------


#pluginList
zplug "b4b4r07/enhancd", use:init.sh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

if ! zplug check --verbose; then
   printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose

# --------------------------------------
# POWERLEVEL9K設定
# --------------------------------------

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)

#タブタイトルにカレントディレクトリのフォルダ名を表示
#precmd () {
#  echo -ne "\e]2;${PWD}\a"
#  echo -ne "\e]1;${PWD:t}\a"
#}


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
#PROMPT='[%F{cyan}%~%f]$ '

alias ls='la -G'
alias ll='ls -lF'
alias la='ls -lA'
alias l='ls -CF'
alias sed="gsed"
alias d="docker"
alias doc="docker-compose"
alias readlink="greadlink"
alias chrm="open /Applications/Google\ Chrome.app"
alias cl="clear"
alias svim='vim -u ~/.SpaceVim/vimrc'
alias dvim='vim -u ~/.vim/essential.vim'

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

# この行は現在のパスを表示する設定です。ブランチを表示して色をつける設定とは関係ありません
#RPROMPT="%{${fg[white]}%}[%~]%{${reset_color}%}"
# %a アクション名（mergeとか）
# %b ブランチ名
# %c = stagedstr
# %u = unstagedstr

#autoload -Uz vcs_info
#setopt prompt_subst
#zstyle ':vcs_info:git:*' check-for-changes true
#zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!" #commitされていない時
#zstyle ':vcs_info:git:*' unstagedstr "%F{red}+" #addされていないファイルがある時
#zstyle ':vcs_info:*' formats "%c%u%f(%F{cyan}%b%f@%r)%f" #通常の表示
#zstyle ':vcs_info:*' actionformats '[%b|%a]' #
#precmd () { vcs_info }
#RPROMPT='${vcs_info_msg_0_}'

# --------------------------------------
# 
# --------------------------------------
export PATH="/usr/local/bin:$PATH"

