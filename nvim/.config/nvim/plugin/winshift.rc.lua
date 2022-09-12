local status, _ = pcall(require, 'winshift')
if(not status) then return end

require'winshift'.setup{}

vim.keymap.set("n", ";ws", "<Cmd>WinShift<CR>")
