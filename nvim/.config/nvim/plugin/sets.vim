" Line numbers
set rnu
set nu

" No search highlight
set nohlsearch

" Buffers in background
set hidden

" No error bells
set noerrorbells

" Tab settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set noexpandtab
" set list listchars=tab:\⎸\ ,trail:·,extends:»,precedes:«,nbsp:×
set list listchars=tab:\│\ ,trail:·,extends:»,precedes:«,nbsp:×
" autocmd! bufreadpost * set noexpandtab | retab! 4

" No wrap
set nowrap

" Options
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Search
set incsearch

" Colors
set termguicolors

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
set colorcolumn=80
" set colorrow=80
""
"" Italic comments
"set t_ZH=^[[3m
"set t_ZR=^[[23m
