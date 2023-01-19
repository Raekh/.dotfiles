return {
	"anuvyklack/windows.nvim",
	lazy = false,
	dependencies = {
		"anuvyklack/middleclass",
	},
	keys = {
		{ ";wz", "WindowsMaximize" },
	},
	opts = {

		autowidth = {
			-- filetype = {
			--     DiffviewFiles = 5,
			-- },
		},
		ignore = {
			-- buftype = { "diffview.nvim" },
			filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "DiffviewFiles" },
		},
		animation = {
			enable = true,
			duration = 300,
			fps = 144,
			easing = "in_out_sine",
		},
	},
	init = function()
		vim.o.winwidth = 10
		vim.o.winminwidth = 10
		vim.o.equalalways = false
	end,
}
