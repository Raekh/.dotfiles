import("guess-indent", function(gi)
	gi.setup({
		auto_cmd = true,
	})

	vim.api.nvim_create_autocmd("VimEnter", {
		group = vim.api.nvim_create_augroup("GuessIndent", { clear = true }),
		command = "autocmd BufReadPost * :silent lua require('guess-indent').set_from_buffer(true)",
	})
end, {})
