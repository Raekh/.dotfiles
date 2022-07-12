require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'lua', 'typescript', 'javascript', 'html', 'css' },
	sync_install = false,
	highlight = {
		enable = true,
		disable = { "html" }
	},
	indent = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true
	}
}

local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
