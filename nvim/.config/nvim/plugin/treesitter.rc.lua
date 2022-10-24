import('nvim-treesitter.configs', function(ts)
	ts.setup {
		highlight = {
			enable = true,
			disable = {},
		},
		indent = {
			enable = true,
			disable = {},
		},
		ensure_installed = {
			'tsx',
			'lua',
			'json',
			'css',
		},
		autotag = {
			enable = true,
		},
		textsubjects = {
			enable = true,
			prev_selection = ',', -- (Optional) keymap to select the previous selection
			keymaps = {
				['.'] = 'textsubjects-smart',
				[';'] = 'textsubjects-container-outer',
				['i;'] = 'textsubjects-container-inner',
			},
		},
	}
end)

