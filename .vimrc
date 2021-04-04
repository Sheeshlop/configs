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
set shiftwidth=2
set autoindent
set smarttab
set softtabstop=2 
set tabstop=8
set expandtab
set showtabline=1
set undolevels=1000

set path+=**
set wildmenu
set wildignore+=**/node_modules/**

"command! MakeTags !ctags -R -f ./.git/tags --exclude=node_modules .
command! MakeTags !ctags -R --exclude=node_modules .
" set tags+=.git/tags
" ^] g^] ^t
"
" ^n autocomplete, ^x^f for file paths, ^x^] for tags

runtime macros/matchit.vim


set backspace=indent,eol,start
set pastetoggle=<F11>

colorscheme delek
syntax on

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
call plug#end()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" set alt-f binding
execute  "set <M-f>=\ef"
map <M-f> <Plug>(easymotion-prefix)

nmap f <Plug>(easymotion-f)
xmap f <Plug>(easymotion-f)
nmap F <Plug>(easymotion-F)
xmap F <Plug>(easymotion-F)

let g:ctrlp_custom_ignore = 'node_modules\|android\|www\|git'

filetype indent on
map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
