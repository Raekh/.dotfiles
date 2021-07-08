syntax on
let mapleader=" "
set rnu 
set colorcolumn=120

call plug#begin()

	Plug 'morhetz/gruvbox'
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
	Plug 'junegunn/fzf.vim'
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

call plug#end()

" To install tabnine
" :CocInstall coc-tabnine

colorscheme gruvbox
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

nnoremap <C-p> :GFiles<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" highlightedyank
let g:highlightedyank_highlight_duration = 200
