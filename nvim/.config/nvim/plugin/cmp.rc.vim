lua << EOF
local cmp = require 'cmp'
local lspkind = require 'lspkind'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end
	},
--	mapping = {
--		["<C-d>"] = cmp.mapping.scroll_docs(-4),
--		["<C-u>"] = cmp.mapping.scroll_docs(4),
--		["<C-Space>"] = cmp.mapping.complete(),
--		["<C-e>"] = cmp.mapping.abort(),
--		["<C-y>"] = cmp.mapping.confirm {
--			behavior = cmp.ConfirmBehavior.Insert,
--			select = true
--		},
--	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-u>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				path = "[path]",
			}
		}
	},
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	},
	experimental = {
		ghost_text = true
	}
}
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})



require'lspconfig'.tsserver.setup {
	capabilities = capabilities,
}
EOF
