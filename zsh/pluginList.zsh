# --------------------------------------
# zplug 初期設定
# --------------------------------------
#自身のパスを取得
SCRIPT_DIR_PATH=$(dirname $(greadlink -f $0))

# zplug settings(Homebrew管理の場合)
#export ZPLUG_HOME=/usr/local/opt/zplug
#source $ZPLUG_HOME/init.zsh

source ~/.zplug/init.zsh

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
