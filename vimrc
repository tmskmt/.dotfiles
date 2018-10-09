"*****************************************************************************
" 分割ファイルの読み込み
"*****************************************************************************"
"テンプレートの読み込み
runtime! config/init/*.vim

"各種プラグイン設定ファイルの読み込み
runtime! config/plugin-config/*.vim

"*****************************************************************************
" バックスペースの有効化
"*****************************************************************************
" vim --with-lua 用の設定
set backspace=indent,eol,start

"*****************************************************************************
" Indent Width
"*****************************************************************************
set shiftwidth=2       "行頭での<Tab>の幅
set tabstop=2          "行頭以外での<Tab>の幅
set expandtab          "<Tab>の代わりに<Space>を挿入する
set softtabstop=2      "expandtabで<Tab>が対応する<Space>の数
set autoindent


"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable

set number
set ruler              "カーソル行が何行目何列目に置かれているか表示
set listchars=eol:¶,tab:_\
set cursorline         "カーソル行ハイライト
set laststatus=2       "ステータス行を常時表示
set title              "編集中のファイル名を表示する
set showmatch          "対応する括弧の強調表示
set matchtime=3        "showmatchの表示時間
set scrolloff=8        "上下の視界確保
set sidescrolloff=16   "左右の視界確保
set nostartofline      "移動コマンド使用時にカーソルを先頭に置かない

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Searching
set incsearch          "インクリメンタルサーチを行う
set hlsearch           "検索結果をハイライトする
set ignorecase         "検索時に文字の大小を区別しない
set smartcase          "検索時に大文字を含んでいたら大小を区別する
set wrapscan           "検索をファイルの先頭へループする

"ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

""スペルチェック
"set spell
"set spelllang=en,cjk "日本語を除外"

set wildmenu wildmode=list:full " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"*****************************************************************************
"" keybind
"*****************************************************************************

inoremap jj <Esc>
inoremap zz <Esc>:w<Cr>
inoremap qq <Esc>:wq<Cr>
inoremap ww <Esc>:w<Cr>i
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

imap <C-j> <esc>
noremap! <C-j> <esc>

nnoremap Y y$
nnoremap ; :
nnoremap ' ;
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap <C-j> 20j
nnoremap <C-k> 20k
 "*****************************************************************************
 "" プラグイン管理
 " *****************************************************************************"

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on


"----------------------------------------------------------
" ステータスラインの設定
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

"----------------------------------------------------------
" クリップボードの共有化
"----------------------------------------------------------


