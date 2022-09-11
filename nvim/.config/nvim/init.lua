require('base')
require('highlights')
require('maps')
require('plugins')
require('sets')

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
vim.cmd [[ colorscheme tokyonight-night ]]
-- vim.cmd [[ colorscheme gruvbox ]]
