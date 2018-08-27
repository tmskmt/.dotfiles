"*****************************************************************************
" vim-plugの設定（プラグイン管理）
"*****************************************************************************"

"https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugins')

" :PlugInstall　をvim起動時に実行でプラグインインストール
" ここにインストールしたいプラグインを書いていく
" Plug '[Github Author]/[Github repo]' の形式で記入


Plug 'tomasr/molokai'
" ステータスラインの表示内容強化
Plug 'itchyny/lightline.vim'
" インデントの可視化
Plug 'Yggdroot/indentLine'
" 末尾の全角と半角の空白文字を赤くハイライト
Plug 'bronson/vim-trailing-whitespace'
" ディレクトリをツリー構造で表示
Plug 'scrooloose/nerdtree'

call plug#end()

