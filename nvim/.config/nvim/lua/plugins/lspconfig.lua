return {
	"neovim/nvim-lspconfig",
	config = function()
		local nvim_lsp = require("lspconfig")
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = false,
		})

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local protocol = require("vim.lsp.protocol")

		-- local function buffer_augroup(group, bufnr, cmds)
		--   vim.api.nvim_create_augroup(group, { clear = false })
		--   vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
		--   for _, cmd in ipairs(cmds) do
		--     local event = cmd.event
		--     cmd.event = nil
		--     vim.api.nvim_create_autocmd(event, vim.tbl_extend("keep", { group = group, buffer = bufnr }, cmd))
		--   end
		-- end

		-- local on_attach = function(client, bufnr)
		-- local detach = function()
		--     vim.lsp.buf_detach_client(bufnr, client.id)
		-- end
		-- buffer_augroup("entropitor:lsp:closing", bufnr, {
		--     { event = "BufDelete", callback = detach },
		-- })
		-- formatting
		-- if client.server_capabilities.documentFormattingProvider then
		-- return true
		-- vim.api.nvim_command [[augroup Format]]
		-- vim.api.nvim_command [[autocmd! * <buffer>]]
		-- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
		-- vim.api.nvim_command [[augroup END]]
		-- end
		-- end

		local function buffer_augroup(group, bufnr, cmds)
			vim.api.nvim_create_augroup(group, { clear = false })
			vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
			for _, cmd in ipairs(cmds) do
				local event = cmd.event
				cmd.event = nil
				vim.api.nvim_create_autocmd(event, vim.tbl_extend("keep", { group = group, buffer = bufnr }, cmd))
			end
		end

		local function on_attach(client, bufnr)
			-- local detach = function()
			--     vim.lsp.buf_detach_client(bufnr, client.id)
			-- end
			-- buffer_augroup("entropitor:lsp:closing", bufnr, {
			--     { event = "BufDelete", callback = detach },
			-- })
		end

		nvim_lsp.tsserver.setup({
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			filetypes = {
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
			},
			cmd = { "typescript-language-server", "--tsserver-path", "/usr/local/bin/tsserver", "--stdio" },
		})

		nvim_lsp.sumneko_lua.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the 'vim' global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		})

		-- vim.api.nvim_create_autocmd('LspAttach',{
		--     callback = function()
		--         vim.api.nvim_create_autocmd('BufDelete',{
		--             buffer = vim.api.nvim_get_current_buf(),
		--             callback = function(opts)
		--                 local bufnr = opts.buf
		--                 local clients = vim.lsp.buf_get_clients(bufnr)
		--                 for client_id, _ in pairs(clients) do
		--                     vim.lsp.buf_detach_client(bufnr, client_id)
		--                 end
		--             end
		--         })
		--     end
		-- })

		-- nvim_lsp.eslint.setup {
		--     on_attach = on_attach,
		-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.tsx", },
		-- 	cmd = { "eslint", "--stdio"},
		-- }

		-- nvim_lsp.eslint.setup {
		-- 	on_attach = on_attach,
		-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.tsx", },
		-- 	-- cmd = { "eslint_d",  "--stdin", "--fix-to-stdout", "--stdin-filename", "%filepath" },
		-- 	cmd = { "eslint_d", "%filepath", "--fix"},
		-- }
	end,
}
