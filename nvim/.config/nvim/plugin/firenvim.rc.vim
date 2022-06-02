let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'priority': 1,
            \ 'takeover': 'never',
        \ },
    \ }
\ }

" let fc = g:firenvim_config['localSettings']
" let fc['.*'] = { 'takeover': 'never' }
lua << EOF


EOF
