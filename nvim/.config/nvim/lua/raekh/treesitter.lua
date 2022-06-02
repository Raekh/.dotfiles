require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'lua', 'typescript', 'javascript', 'html', 'css' },
	sync_install = false,
	highlight = {
		enable = true,
		disable = { "html" }
	}
}
