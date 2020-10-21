"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SYNTAX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SET PARAMS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"GENERAL
set history=200
"shows title as window title
set title
"always keeps cmd on even if not in command mode
set showcmd
"makes vim compatible with all terminals colors
set termguicolors
"cmd height is 2 lines instead of one
set cmdheight=2
"sets update time to 50ms
set updatetime=50
"sets error messages to short
set shortmess+=c

""EDITOR
"disables stupid vi residual behaviour
set nocompatible
"sets line numbers
set nu
"when presing backspace the given flags will be consumed/ignored/overriden
set backspace=indent,eol,start
"no wrapping of text at end of screen
set nowrap
"sets tab to 4 spaces instead of 8
set tabstop=4 softtabstop=8
set shiftwidth=4
"current line is highlighted
set ruler
"disables the f***** error bells
set noerrorbells
"i dont even remember what these do :)
set expandtab
set shiftround
set nojoinspaces
set cursorline

""MISC
"enables conformation prompt
set confirm
set hidden
"disables modeline, just spam esc to make sure youre in command mode!
set nomodeline
"sets number format to octal
set nrformats -=octal

""AUTOINDENT
"enables autoindent
set autoindent
"enables the lisp auto indent engine
set lisp

""SEARCH
"enables highlighting of the word being searched
set hls
"smart case sensitive search
set smartcase
"will start showing results as soon as you start typing
set incsearch
"again no idea what this does!
set wildmenu

""SETTING DIRECTORIES
"eliminate stupid backup and swap files
"vim will use the following directories instead
silent !mkdir -p ~/.vim/backup
set backupdir=~/.vim/backup//
silent !mkdir -p ~/.vim/swap
set directory=~/.vim/swap//
silent !mkdir -p ~/.vim/undo
set undodir=~/.vim/undo//

"from here onwards no explanation is given. Please just read the INSTALL file
"for info about the pluggins being used
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
