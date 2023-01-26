return {
	{
		"CKolkey/ts-node-action",
		dependencies = {
			"nvim-treesitter",
		},
		keys = {
			{ ";ts", "NodeAction" },
		},
		config = true,
	},
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
		end,
	},
}
