let raekh_colorscheme = "gruvbox"
fun! RkColor()
	set termguicolors
	let g:gruvbox_invert_selection = '0'
	if has('nvim')
		call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:raekh_colorscheme])
	else
		colorscheme gruvbox
	endif
	set background=dark

	if exists('+termguicolors')
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		set termguicolors
	endif
endfun

call RkColor()

nnoremap <leader>cwm :call RkColor()<CR>
nnoremap <leader>vwb :let g:raekh_colorscheme =
