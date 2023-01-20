return {
	"glepnir/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			server_filetype_map = {},
			code_action_lightbulb = {
				enable = false,
				-- enable_in_insert = true,
				-- cache_code_action = true,
				-- sign = true,
				-- update_time = 150,
				-- sign_priority = 20,
				-- virtual_text = true,
			},
		})

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
		-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
		vim.keymap.set("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
		vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", opts)
		vim.keymap.set("n", "gi", "<Cmd>lua vim.lsp.buf.format()<CR>", opts)
	end,
}

-- import("lspsaga", function(saga)
--     saga.setup({
--         server_filetype_map = {},
--         code_action_lightbulb = {
--             enable = false,
--             -- enable_in_insert = true,
--             -- cache_code_action = true,
--             -- sign = true,
--             -- update_time = 150,
--             -- sign_priority = 20,
--             -- virtual_text = true,
--         },
--     })

--     local opts = { noremap = true, silent = true }
--     vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
--     vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
--     vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
--     vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
--     -- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
--     vim.keymap.set("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--     vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
--     vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
--     vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", opts)
--     vim.keymap.set("n", "gi", "<Cmd>lua vim.lsp.buf.format()<CR>", opts)
-- end, {})
