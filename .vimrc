set noswapfile
set nobackup
set number
set rnu
set nowrap
set showmatch	
set visualbell
set hlsearch
set smartcase
set incsearch
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set ruler
set showtabline=1
set undolevels=1000

set backspace=indent,eol,start
set pastetoggle=<F11>

colorscheme delek
syntax on

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
call plug#end()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <Leader> <Plug>(easymotion-prefix)
