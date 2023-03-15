return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	config = function()
		vim.fn["mkdp#util#install"]()
	end,
}
