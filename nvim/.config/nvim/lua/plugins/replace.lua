return {
	"cshuaimin/ssr.nvim",
	keys = {
		{
			";sR",
			function()
				require("ssr").open()
			end,
			mode = { "n", "x" },
			desc = "Structural Replace",
		},
	},
}
