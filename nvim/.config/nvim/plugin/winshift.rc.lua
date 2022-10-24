import('winshift', function(winshift)
    winshift.setup{}

    vim.keymap.set("n", ";ws", "<Cmd>WinShift<CR>")
end)
