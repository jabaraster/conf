set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'molokai'
Bundle 'git://github.com/dag/vim2hs.git'
Bundle 'git://github.com/ujihisa/neco-ghc.git'

Bundle 'quickrun.vim'
Bundle 'Markdown'

" Bundle 'http://www.vim.org/scripts/script.php?script_id=362'
Bundle 'scrooloose/nerdtree'

filetype plugin indent on     " required!

" http://nanasi.jp/

" http://nanasi.jp/articles/howto/config/colorscheme.html
"colorscheme solarized
"colorscheme zenburn
"colorscheme chocolateliquor
colorscheme molokai

" http://blog.blueblack.net/item_110
"set autoindent
"set hidden
set incsearch
set number
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set list
set listchars=tab:»-,trail:^,eol:↲,extends:»,precedes:«,nbsp:%
set showmatch
set smartcase
set smartindent

" タブ文字の代わりに半角空白を挿入する
set expandtab

" 行頭から前の位置にカーソルを移動したときに前行の行末に移動する設定
" set whichwrap=b,s,h,l,<,>,[,]
set wrapscan

" http://code.google.com/p/macvim-kaoriya/wiki/readme#vimrc/gvimrc
" ツールバー非表示
set guioptions-=t

" 自動改行の抑止
set tw=0
set formatoptions=q

" 検索時に大文字小文字を区別しない
set ignorecase

"ファイルの上書きの前にバックアップを作る/作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set nowritebackup

"バックアップ/スワップファイルを作成する/しない
set nobackup

" 現在行反転
set cursorline

noremap : ;
noremap ; :

" .vimrcを開く
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>

" source ~/.vimrc を実行する。
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR> 

nnoremap <Space>t  :NERDTree<CR> 

highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CursorLine gui=underline guifg=NONE guibg=NONE

" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
syntax on

" podバグ対策
syn sync fromstart

function! ActivateInvisibleIndicator()
	syntax match invisiblejisx0208space "　" display containedin=all
	highlight invisiblejisx0208space term=underline ctermbg=blue guibg=darkgray gui=underline
	"syntax match invisibletrailedspace "[ \t]\+$" display containedin=all
	"highlight invisibletrailedspace term=underline ctermbg=red guibg=none gui=undercurl guisp=darkorange
	"syntax match invisibletab "\t" display containedin=all
	"highlight invisibletab term=underline ctermbg=white gui=undercurl guisp=darkslategray
	endf
	augroup invisible
	autocmd! invisible
autocmd bufnew,bufread * call ActivateInvisibleIndicator()
	augroup end
endif

autocmd BufRead,BufNewFile *.mkd  setfiletype mkd
autocmd BufRead,BufNewFile *.md  setfiletype mkd
