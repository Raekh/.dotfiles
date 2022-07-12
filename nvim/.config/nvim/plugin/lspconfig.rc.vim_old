" if !exists('g:lspconfig')
" 	finish
" endif

lua << EOF

local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings
	local opts = { noremap = true, silent = true }
	buf_set_keymap('n', '<leader>vd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	-- " buf_set_keymap('n', '<leader>vd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', '<leader>vi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<leader>vsh', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<leader>vrr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<leader>vbh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', '<leader>vrn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>vca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', '<leader>vsd', '<Cmd>lua vim.diagnostic.get()<CR>;', opts)
	-- " vim.util.show_line_diagnostics()<CR>
	buf_set_keymap('n', '<leader>vn', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<leader>vp', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	-- " buf_set_keymap('n', 'vll', ':call LspLocationList()<CR>', opts)
	-- " buf_set_keymap(. 'n', ':'call L,s'pCodeAction()<CR>', opts)
end

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}

EOF

