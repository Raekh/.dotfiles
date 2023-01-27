return {
	"ldelossa/nvim-ide",
	config = function()
		require("ide").setup({
			icon_set = "default",
			log_level = "info",
		})
	end,
}
