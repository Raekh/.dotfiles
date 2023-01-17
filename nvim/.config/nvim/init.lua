local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Custom Functions

-- Plugin setup
require('plugins')
require('impatient')
require('base')
require('highlights')
require('maps')
require('plugins')
require('sets')

vim.cmd [[ colorscheme tokyonight-moon ]]
