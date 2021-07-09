syntax on
let mapleader=" "
set number
set rnu 
set colorcolumn=120

call plug#begin()

	Plug 'morhetz/gruvbox'
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'Quramy/tsuquyomi'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
	Plug 'junegunn/fzf.vim'
	Plug 'stsewd/fzf-checkout.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'preservim/nerdtree'
	Plug 'ggreer/the_silver_searcher'
	Plug 'thePrimeagen/vim-be-good'
	Plug 'wellle/targets.vim'
	Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
	Plug 'nvim-lua/popup.nvim'
	Plug 'ThePrimeagen/harpoon'
	Plug 'machakann/vim-highlightedyank'
	Plug 'djoshea/vim-autoread'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'

call plug#end()

" To install tabnine
" :CocInstall coc-tabnine
"
  "dependencies": {
    "coc-actions": ">=1.5.0",
    "coc-angular": ">=11.2.9",
    "coc-json": ">=1.3.6",
    "coc-tabnine": ">=1.3.4",
    "coc-tsserver": ">=1.8.1"
"  }

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPS='--reverse --color=always'
nnoremap <leader>gc :GCheckout<CR>

colorscheme gruvbox
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

nnoremap <C-p> :GFiles<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nmap <leader>gs :G<CR>
nmap <leader>gh :diffget \\3<CR>
nmap <leader>gh :diffget \\2<CR>

" highlightedyank
let g:highlightedyank_highlight_duration = 200
