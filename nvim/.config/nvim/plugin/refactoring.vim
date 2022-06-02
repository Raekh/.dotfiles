lua require("raekh")

vnoremap <silent> <leader>rr :lua require("raekh.telescope").refactors()<CR>
nnoremap <silent> <leader>rr :lua require("raekh.telescope").refactors()<CR>
nnoremap <silent> <leader>df :lua require("refactoring").debug.printf({below=false})<CR>
nnoremap <silent> <leader>db :lua require("refactoring").debug.printf({below=true})<CR>
