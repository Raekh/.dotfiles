import('symbols-outline', function(so)
    so.setup()
    vim.keymap.set('n', ';so', '<Cmd>SymbolsOutline<CR>')
end)
