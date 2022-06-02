lua require("raekh")

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pl :lua require('telescope.builtin').live_grep()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('raekh.telescope').search_dotfiles()<CR>
nnoremap <leader>vrd :lua require('raekh.telescope').search_config()<CR>
nnoremap <leader>va :lua require('raekh.telescope').background_selector()<CR>
nnoremap <leader>gc :lua require('raekh.telescope').git_branches()<CR>
nnoremap <leader>ns :lua require('raekh.telescope').search_sources()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
