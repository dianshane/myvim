"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SYNTAX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SET PARAMS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"GENERAL
set history=200
set title
set showcmd
set termguicolors
set cmdheight=2
set updatetime=50
set shortmess+=c

""EDITOR
set nocompatible
set nu
set backspace=indent,eol,start
set nowrap
set tabstop=4 softtabstop=8
set shiftwidth=4
set ruler
set noerrorbells
set expandtab
set shiftround
set nojoinspaces

""MISC
set confirm
set hidden
set nomodeline
set nrformats -=octal

""AUTOINDENT
set autoindent
set lisp

""SEARCH
set hls
set smartcase
set incsearch
set wildmenu

""SETTING DIRECTORIES
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""PLUG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

""PLUGINS
	Plug 'vim-utils/vim-man'
	Plug 'https://github.com/preservim/nerdtree.git'
	Plug 'sheerun/vim-polyglot'
	Plug 'vim-jp/vim-cpp'
	Plug 'neoclide/jsonc.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'frazrepo/vim-rainbow'
    Plug 'preservim/nerdcommenter'
    
""COC AUTOCOMPLETE REQUIREMENTS
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    
""COLORS
	Plug 'gruvbox-community/gruvbox'


call plug#end()
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""REMAPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ` :NERDTree <CR>
let mapleader=" "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""PLUGIN CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
	let g:rg_derive_root='true'
endif




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""SET COLOR SCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark