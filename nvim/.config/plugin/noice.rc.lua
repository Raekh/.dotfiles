import("noice", function(noice)
	noice.setup({
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
