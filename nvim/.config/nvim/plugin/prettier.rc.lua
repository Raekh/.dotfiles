import('prettier', function(prettier)
	prettier.setup {
		cli_options = {
			config_precedence = 'file-override'
		},
		bin = 'prettierd',
		filetypes = {
			'css',
			'javascript',
			'javascriptreact',
			'typescript',
			'typescriptreact',
			'json',
			'scss',
			'less'
		}
	}
end)
