" == Useful sets
set path+=**

set wildmode=longest,list,full
set wildmenu

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/node_modules/*
set wildignore+=*/android/*
set wildignore+=*/ios/*
set wildignore+=*/.git/*
" ====
"
" ==== Packages
call plug#begin('~/.vim/plugged')
" == Themes and visual stuff
" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Yank highlight
Plug 'machakann/vim-highlightedyank'
" ====
"
" == Helpers
" LSP
" Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'sharkdp/fd'
" Autocompletion
" Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': ':CocInstall coc-actions coc-angular coc-json coc-tabnine coc-tsserver' }
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
" Quick comments
Plug 'tpope/vim-commentary'
" Better ci
Plug 'wellle/targets.vim'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Debugger Plugins
" Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Harpoon
Plug 'theprimeagen/harpoon'
Plug 'theprimeagen/rfc-reader'
Plug 'mhinz/vim-rfc'
" Prettier
Plug 'sbdchd/neoformat'
" ====
"
" == Git related stuff
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'theprimeagen/git-worktree.nvim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
" ====
"
" == Miscellaneous
Plug 'rust-lang/rust.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'tpope/vim-projectionist'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-surround'
Plug 'theprimeagen/vim-with-me'
" ====
call plug#end()
" ======

"
" == Miscellaneous
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
" ====
"
" == Includes
lua require("raekh")
" ====
"
" == Useful lets
let mapleader=" "
let loaded_matchparen = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menuone,noinsert,noselect
let g:highlightedyank_highlight_duration = 200
" ====
"
" == Some remaps
" Escape
inoremap <C-c> <esc>
" Great remaps
vnoremap <leader>p "_dP
nnoremap <leader>y "+y

vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" Snippet
nnoremap <Leader>ww ofunction wait(ms: number): Promise<void> {<CR>return new Promise(res => setTimeout(res, ms));<CR>}<esc>k=i{<CR>
" Disable Ex mode
nnoremap <silent> Q <nop>
" Disable navigation keys
nmap <Up> <nop>
nmap <Down> <nop>
nmap <Left> <nop>
nmap <Right> <nop>
" Resource config file
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
" Resize
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
" Various commands
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>gt <Plug>PlenaryTestFile
nnoremap <leader>vwm :lua require("vim-with-me").init()<CR>
nnoremap <leader>dwm :lua require("vdm-with-me").disconnect()<CR>

nnoremap J :m '>+1<CR>gv=gv
nnoremap K :m '<-2<CR>gv=gv
" ====
"
" == Functions
fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

augroup RAEKH
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
" ====
"
" == ES
com! W w
" ====
"
