let mapleader=" "

" ==== Packages
call plug#begin('~/.vim/plugged')
" Reload config
Plug 'famiu/nvim-reload'
" Better keyboard mappings
Plug 'b0o/mapx.nvim'
" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'dylanaraps/wal.vim'
" Style
Plug 'hoob3rt/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'gcmt/taboo.vim'
Plug 'machakann/vim-highlightedyank'
" Autoclose
" Plug 'cohama/lexima.vim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
" Lint
Plug 'w0rp/ale'
" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'
Plug 'weilbith/nvim-code-action-menu'
Plug 'williamboman/nvim-lsp-installer'
" Completion/Lsp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" Lsp icons
Plug 'onsails/lspkind.nvim'
" Diagnostics
Plug 'onsails/diaglist.nvim'
" Misc
Plug 'kosayoda/nvim-lightbulb'
Plug 'kevinhwang91/nvim-bqf'
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/dsf.vim'
Plug 'arithran/vim-delete-hidden-buffers'
" Fuzzy finders
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'sharkdp/fd'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-angular'
Plug 'nvim-treesitter/playground'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Git
Plug 'junegunn/gv.vim'
" Undo
Plug 'mbbill/undotree'

"tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
"the primagen
Plug 'theprimeagen/harpoon'
Plug 'theprimeagen/rfc-reader'
Plug 'theprimeagen/jvim.nvim'
Plug 'theprimeagen/git-worktree.nvim'
" Unknown
Plug 'folke/trouble.nvim'
Plug 'j5shi/CommandLineComplete.vim'

" Trial
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'glacambre/firenvim', {'do': ':firenvim#install()'}
Plug 'github/copilot.vim'
Plug 'hrsh7th/cmp-copilot'
Plug '907th/vim-auto-save'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'samjwill/nvim-unception'
call plug#end()

lua require("raekh")
