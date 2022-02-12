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
set noexpandtab
set shiftround
set nojoinspaces
set cursorline
set undofile

""MISC
set confirm
set hidden
set nomodeline
set nrformats -=octal
set signcolumn=number
"for lightline
set noshowmode
set laststatus=2

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

""VIM CONFIG
if executable('rg')
	let g:rg_derive_root='true'
endif

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
    "general
    Plug 'vim-utils/vim-man'
	Plug 'frazrepo/vim-rainbow'
    Plug 'preservim/nerdcommenter'
	Plug 'tpope/vim-surround'
    "Plug 'tmhedberg/matchit'
	Plug 'sheerun/vim-polyglot'
    "Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'
    "Plug 'amiorin/vim-project'
    Plug 'itchyny/vim-cursorword'
    Plug 'machakann/vim-highlightedyank'
    "tags
    Plug 'preservim/tagbar'
    Plug 'ludovicchabant/vim-gutentags'
    "files
    Plug 'https://github.com/preservim/nerdtree.git'
    "Plug 'junegunn/fzf.vim'
    "data
	"Plug 'neoclide/jsonc.vim'
    "git
    "Plug 'airblade/vim-gitgutter'
    "Plug 'tpope/vim-fugitive'
    "autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "c++
    Plug 'vim-jp/vim-cpp'
    "html
    Plug 'mattn/emmet-vim'
    "javascript
    Plug 'pangloss/vim-javascript'
    "Plug 'MarcWeber/vim-addon-mw-utils'
    "Plug 'grvcoelho/vim-javascript-snippets', {
    "\ 'do': 'npm install'}
    "php
	Plug 'StanAngeloff/php.vim'
	Plug 'stephpy/vim-php-cs-fixer' 
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'
	Plug 'phpactor/ncm2-phpactor'

""COC AUTOCOMPLETE REQUIREMENTS (as sugested by the developers)
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    
""COLORS
    Plug 'gruvbox-community/gruvbox'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""REMAPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ` :NERDTree <CR>
let mapleader=" "
nmap <LEADER>hh :CocCommand clangd.switchSourceHeader <CR>
nmap <F1> :TagbarToggle<CR>

nmap <Leader>q :Bdelete<CR>

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""PLUGIN CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enable rainbow globaly
let g:rainbow_active = 1

""prettier config
"nmap <Leader>p <Plug>(Prettier)
"let g:prettier#autoformat = 1
""require @format or @prettier tags to enable formatting
"let g:prettier#autoformat_require_pragma = 1
"let g:prettier#config#config_precedence = 'file-override'

"vim-javascript config
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END



"""polyglot config
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""SET COLOR SCHEME AND LIGHTLINE SCHEME
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
