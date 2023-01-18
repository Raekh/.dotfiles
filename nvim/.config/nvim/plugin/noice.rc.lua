import("noice", function(noice)
	require("noice").setup({
		lsp = {
			signature = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
			-- message = {
			-- 	enabled = false,
			-- },
		},
	})
end, {})
