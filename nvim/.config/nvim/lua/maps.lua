local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
keymap.set('n', 'to', ':tabo<Return>', { silent = true })
keymap.set('n', 'tx', ':tabclose<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Escape
keymap.set('i', '<C-c>', '<Esc>')
keymap.set('t', '<leader><C-c>', '<Esc>')

-- Yank & paste
keymap.set('v', '<leader>p', '"_dp')
keymap.set('n', '<leader>y', '"+y')

keymap.set('v', '<leader>y', '"_dp')
keymap.set('n', '<leader>Y', 'gg"+yG')
keymap.set('n', '<leader>d', '"_d')
keymap.set('v', '<leader>d', '"_d')

keymap.set('n', 'Y', 'y$')

-- Search
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- Append
keymap.set('n', 'J', 'mzJ`z')

-- Add undo marks
keymap.set('i', ',', ',<c-g>u')
keymap.set('i', '.', '.<c-g>u')
keymap.set('i', '!', '!<c-g>u')
keymap.set('i', '?', '?<c-g>u')

keymap.set('v', 'J', ":m '>+1'<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2'<CR>gv=gv")

keymap.set('n', 'zj', 'o<Esc>k')
keymap.set('n', 'zk', 'O<Esc>j')

keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

keymap.set('n', 'Q', '<nop>', { silent = true })

-- Custom snippets
-- keymap.set('n', '<leader>cl', 'yssfconsole.log<CR>A;^C_f(')
-- keymap.set('n', '<leader>cll', 'yssfconsole.log<CR>A;^C_f(a"%c", "", ^CFca')
-- keymap.set('n', '<leader>cls', 'yssfconsole.log<CR>ysi("a%c^Cf"a, ""^CA;^CF"i')
