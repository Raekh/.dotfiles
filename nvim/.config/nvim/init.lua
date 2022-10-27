require('import')
import('impatient')

import('base')
import('highlights')
import('maps')
import('plugins')
import('sets')

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
	require('macos')
end
if is_win then
	require('windows')
end

vim.cmd [[ runtime scratch/automagic/part3.lua ]]

-- Small trick to fix theme related issues
vim.cmd [[ colorscheme tokyonight-moon ]]
-- vim.cmd [[ hi VertSplit guifg=#aaaaaa guibg=NONE ]]
-- vim.cmd [[ colorscheme gruvbox ]]
