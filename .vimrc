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
set cursorline

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
silent !mkdir -p ~/.vim/backup
set backupdir=~/.vim/backup//
silent !mkdir -p ~/.vim/swap
set directory=~/.vim/swap//
silent !mkdir -p ~/.vim/undo
set undodir=~/.vim/undo//


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""PLUG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CHECKING PLUG
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"CALLING PLUG
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
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-surround'
    Plug 'mattn/emmet-vim'
    Plug 'dense-analysis/ale'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-fugitive'
    
""COC AUTOCOMPLETE REQUIREMENTS
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    
""COLORS
	Plug 'gruvbox-community/gruvbox'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""REMAPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ` :NERDTree <CR>
let mapleader=" "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fugitive
nnoremap <leader>ga :Git add . <CR>
map <Leader>gg :Git commit <CR>
map <Leader>gp :Git push <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""PLUGIN CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
	let g:rg_derive_root='true'
endif

"enable rainbow globaly
let g:rainbow_active = 1

"ale config dumped from web
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1

"ALE supports automatic imports from external modules.
let g:ale_completion_autoimport = 1

"remaping go to definition function
map <leader> g d : :ALEGoToDefinition

"this line needs to be added for coc and ale to cooperate because ale has lsp
"features itself
"i also had to add "diagnostic.displayByAle": true to my coc-config
let g:ale_disable_lsp = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""SET COLOR SCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark
