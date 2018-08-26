"*****************************************************************************
" vim-plugの設定（プラグイン管理）
"*****************************************************************************"

"https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugins')

" :PlugInstall　をvim起動時に実行でプラグインインストール
" ここにインストールしたいプラグインを書いていく
" Plug '[Github Author]/[Github repo]' の形式で記入

Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
call plug#end()
