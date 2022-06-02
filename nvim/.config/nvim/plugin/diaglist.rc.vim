
" lua << EOF

" local diaglist = require 'diaglist'
" require'mapx'.setup{ global = true }

" diaglist.init({
" 	debug = false,
" 	debounce_ms = 150,
" })

" --" nmap <leader>sdw <cmd>lua require('diaglist').open_all_diagnostics()<CR>
" --" nmap <leader>sd0 <cmd>lua require('diaglist').open_buffer_diagnostics()<CR>
" nnoremap('<leader>sdw', '<cmd>lua require("diaglist").open_all_diagnostics()<CR>')
" nnoremap('<leader>sd0', '<cmd>lua require("diaglist").open_buffer_diagnostics()<CR>')
" EOF

