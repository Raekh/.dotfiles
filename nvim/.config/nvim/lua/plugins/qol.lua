return {
	"kazhala/close-buffers.nvim",
	"aduros/ai.vim",
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "NMAC427/guess-indent.nvim" },
		opts = {
			show_current_context = true,
			show_current_context_start = true,
		},
		init = function()
			vim.opt.list = true
			vim.g.indent_blankline_filetype_exclude = {
				"help",
				"startify",
				"dashboard",
				"alpha",
				"packer",
				"NeogitStatus",
				"NeogitCommitView",
				"NeogitPopup",
				"NeogitLogView",
				"NeogitCommitMessage",
				"man",
				"sagasignature",
				"sagahover",
				"lspsagafinder",
				"LspSagaCodeAction",
				"TelescopePrompt",
				"NvimTree",
				"Trouble",
				"DiffviewFiles",
				"DiffviewFileHistory",
				"Outline",
				"lspinfo",
				"fugitive",
				"norg",
			}
		end,
	},
	{
		"NMAC427/guess-indent.nvim",
		lazy = false,
		config = function()
			require("guess-indent").setup({
				auto_cmd = true,
			})

			vim.api.nvim_create_autocmd("VimEnter", {
				group = vim.api.nvim_create_augroup("GuessIndent", { clear = true }),
				command = "autocmd BufReadPost * :silent lua require('guess-indent').set_from_buffer(true)",
			})
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			override = {},
			default = true,
		},
	},
	{
		"nacro90/numb.nvim",
		opts = {
			show_numbers = true, -- Enable 'number' for the window while peeking
			show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
			centered_peeking = true, -- Peeked line will be centered relative to window
		},
	},
	{ "folke/todo-comments.nvim", config = true },
	{
		"simrat39/symbols-outline.nvim",
		config = true,
		keys = {
			{ ";so", ":SymbolsOutline<CR>" },
		},
	},
}
