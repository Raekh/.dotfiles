local saga = require 'lspsaga'
local kind = require ('lspsaga.lspkind')
local action = require('lspsaga.codeaction')

-- kind[type_number][2] = icon -- see lua/lspsaga/lspkind.lua

saga.init_lsp_saga()

saga.init_lsp_saga({

})


vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true, noremap = true })
vim.keymap.set("v", "<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
	action.range_code_action()
end, { silent = true, noremap = true})
