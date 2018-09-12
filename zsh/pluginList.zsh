# zplug settings(Homebrew)
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
# zplug settings(git)
#source ~/.zplug/init.zsh

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
