vim.cmd [[ com! W w ]]
vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200} ]]
-- vim.cmd [[ let g:python3_host_prog = '/usr/local/bin/python3' ]]
