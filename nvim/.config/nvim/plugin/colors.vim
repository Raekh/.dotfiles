let raekh_colorscheme = "gruvbox"
" let raekh_colorscheme = ""
fun! ColorMyShit()
    " set termguicolors
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection = '0'

    set background=dark
    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:raekh_colorscheme])
    else
        " What the way to use g:raekh_colorscheme
        colorscheme gruvbox
    endif

    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    highlight Comment cterm=italic gui=italic
    hi TelescopeBorder guifg=#5eacd3
    " Old commands
    " highlight LineNr guibg=#5eacd3
    " LSP Settings
    hi LspDiagnosticsVirtualTextError guifg=#cc241d gui=bold,italic,underline
    hi LspDiagnosticsVirtualTextWarning guifg=#d79921 gui=bold,italic,underline
    hi LspDiagnosticsVirtualTextInformation guifg=#458588 gui=bold,italic,underline
    hi LspDiagnosticsVirtualTextHint guifg=#689d6a gui=bold,italic,underline
endfun
call ColorMyShit()

nnoremap <leader>cwm :call ColorMyShit()<CR>
nnoremap <leader>vwb :let g:raekh_colorscheme =
