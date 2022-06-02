" ==== Useful sets
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

set sessionoptions+=tabpages,globals

" ==== Useful lets
let mapleader=" "
let loaded_matchparen = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" set completeopt=menuone,noinsert,noselect
" set completeopt=menu,menuone,noselect
" set completeopt=menu,menuone " Latest one to work correctly before nvim 0.7
set completeopt=menuone,noselect

let g:highlightedyank_highlight_duration = 200
let g:completion_enable_auto_popup = 1

let g:ale_fixers = {  'typescript': ['eslint'], 'javascript': ['eslint'] }
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1

" Indent lines
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char = '⎸'

" ==== Remaps
" Escape
inoremap <C-c> <Esc>
tnoremap <leader><Esc> <C-\><C-n>

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
inoremap <C-j> <Esc>:m .+1<CR>==i
inoremap <C-k> <Esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap zj o<Esc>k
nnoremap zk O<Esc>j

nnoremap o o<Esc>
nnoremap O O<Esc>

vnoremap < <gv
vnoremap > >gv

nnoremap <silent> Q <nop>

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
nnoremap te :tabedit<CR>
nnoremap to :tabo<CR>
nnoremap tx :tabc<CR>
nnoremap tl :tabm +1<CR>
nnoremap th :tabm -1<CR>
nnoremap t, :TabooRename<Space>
nnoremap tr :TabooReset<CR>
nnoremap t$ :tabm<CR>


nnoremap <leader>ghw :h <C-R>expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>pv :Ex<CR>

nnoremap <leader>ws :delm a<CR>ma:windo :0<CR>:windo set cursorbind cursorline scrollbind<CR><C-w>w'a:delm a<CR>
nnoremap <leader>wu :delm a<CR>ma:windo set nocursorbind nocursorline noscrollbind<CR><C-w>w'a:delm a<CR>

nnoremap <C-Left> :lua require("jvim").to_parent()<CR>zzzv
nnoremap <C-Right> :lua require("jvim").descend()<CR>zzzv
nnoremap <C-Up> :lua require("jvim").prev_sibling()<CR>zzzv
nnoremap <C-Down> :lua require("jvim").next-sibling()<CR>zzzv

com! W w
" ==== Snippets
nmap <leader>cl yssfconsole.log<CR>A;_f(
nmap <Leader>cll yssfconsole.log<CR>A;_f(a"%c", "", Fca
nmap <Leader>cll yssfconsole.log<CR>A;_f(a"%c", "", Fca
nmap <Leader>cls yssfconsole.log<CR>ysi("a%cf"a, ""A;F"i
" ==== Functions
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

" ==== Autogroups
augroup RAEKH
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
augroup END
