return {
	 	"folke/noice.nvim",
	 	event = "VimEnter",
	 	dependencies = {
	 		"MunifTanjim/nui.nvim",
	 		"rcarriga/nvim-notify",
	 	},
        opts = {
            lsp = {
                signature = {
                    enabled = false,
                },
                hover = {
                    enabled = false,
                },
            },
        },
}
