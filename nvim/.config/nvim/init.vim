"}== Useful sets
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
Plug 'ashzero2/VimPilot'
" == Themes and visual stuff
" Dashboard
" Plug 'glepnir/dashboard-nvim'
" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'dylanaraps/wal.vim'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
" Vim airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'hoob3rt/lualine.nvim'
" Yank highlight
Plug 'machakann/vim-highlightedyank'
" Indent lines
" Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'Yggdroot/indentLine'
" LSP error handling
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" ====
"
" == Helpers
" Tree
" Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
" LSP
" Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'sublimelsp/LSP-tailwindcss'
Plug 'ray-x/lsp_signature.nvim'
" Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'folke/lsp-colors.nvim'
" QuickFix
Plug 'kevinhwang91/nvim-bqf'
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
" Refactor
Plug 'theprimeagen/refactoring.nvim'
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
" Plug 'windwp/nvim-autopairs'
" Plug 'jiangmiao/auto-pairs'
Plug 'LunarWatcher/auto-pairs'
Plug 'AndrewRadev/dsf.vim'
Plug 'theprimeagen/vim-with-me'
" ====
call plug#end()
" ======

" == Includes
lua require("raekh")
" ====
"
" == Miscellaneous
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
" ====
"
" == Useful lets
let mapleader=" "
" ====
"
" == Useful lets
let mapleader=" "
let loaded_matchparen = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menuone,noinsert,noselect
let g:highlightedyank_highlight_duration = 200
let g:completion_enable_auto_popup = 1
" ====
"
" == indentLine
" let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char = '⎸'
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

nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap zj o<Esc>k
nnoremap zk O<Esc>j

nnoremap o o<Esc>
nnoremap O O<Esc>

vnoremap < <gv
vnoremap > >gv
" Snippet

nnoremap <Leader>ww ofunction wait(ms: number): Promise<void> {<CR>return new Promise(res => setTimeout(res, ms));<CR>}<esc>k=i{<CR>
nmap <Leader>cl yss)iconsole.log<Esc>ww
nmap <Leader>cll <Leader>cli"", "", bbla%c
"Disable Ex mode
nnoremap <silent> Q <nop>
" Disable navigation keys
" nmap <Up> <nop>
" nmap <Down> <nop>
" nmap <Left> <nop>
" nmap <Right> <nop>
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
" ====
"
" == Functions
fun! EmptyRegisters()
	let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
	for r in regs
		call setreg(r, [])
	endfor
endfun

fun! CenterSearch()
	let cmdtype = getcmdtype()
	if cmdtype == '/' || cmdtype == '?'
		return "\<enter>zz"
	endif
	return "\<enter>"
endfun

cnoremap <silent> <expr> <enter> CenterSearch()

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
