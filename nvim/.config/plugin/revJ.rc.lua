import('trevj', function(revj)
    revj.setup()
    vim.keymap.set('n', ';j', '<Cmd>lua require("trevj").format_at_cursor()<CR>')
end)
