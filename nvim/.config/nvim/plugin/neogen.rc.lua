local status, neogen = pcall(require, 'neogen')
if (not status) then return end

neogen.setup()

vim.keymap.set('n', ';ca', '<Cmd>Neogen<CR>')
