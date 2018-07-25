"*****************************************************************************
" Indent Width
"*****************************************************************************"
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



set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

 "*****************************************************************************
 "" プラグイン管理
 " *****************************************************************************"
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする・・・・・・①
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------
" ここに追加したいVimプラグインを記述する・・・・・・②

" カラースキームmolokai
NeoBundle 'tomasr/molokai'
" ステータスラインの表示内容強化
NeoBundle 'itchyny/lightline.vim'




"----------------------------------------------------------
call neobundle#end()

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定・・・・・・③
NeoBundleCheck

"----------------------------------------------------------
" molokaiの設定
"----------------------------------------------------------
if neobundle#is_installed('molokai') " molokaiがインストールされていれば
    colorscheme molokai " カラースキームにmolokaiを設定する
endif

set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける



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
set clipboard+=unnamed


"----------------------------------------------------------
" esc control+j 
"----------------------------------------------------------
imap <C-j> <esc>
noremap! <C-j> <esc>


autocmd BufNewFile *.sh 0r $HOME/.vim/template/shell.txt
