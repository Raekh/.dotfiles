set nocompatible
set ttyfast

" Line numbers
set rnu
set nu

" No search highlight
set nohlsearch

" Buffers in background
set hidden

" Tab settings
set tabstop=4 softtabstop=4
set shiftwidth=4
filetype plugin indent on
set autoindent
set noexpandtab
set list listchars=tab:\│\ ,trail:·,extends:»,precedes:«,nbsp:×

" No wrap
set nowrap

" Options
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Search
set incsearch

" Scroll before the end of the screen
set scrolloff=8

" Sign column
set signcolumn=yes

" Add characters to file names
set isfname+=@-@

" More space for displaying messages
set cmdheight=1

" Lower update time
set updatetime=50

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Color column for `max-len`
set colorcolumn=140

" View command results asynchronously
set inccommand=nosplit

" Italic comments
set t_ZH=^[[3m
set t_ZR=^[[23m

" Javascript settings
setl nospell
setl nowrap
setl tabstop=4
setl shiftwidth=4
setl smartindent
setl noexpandtab
let b:vcm_tab_complete = 'javascript'
let b:javascript_fold = 1
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
