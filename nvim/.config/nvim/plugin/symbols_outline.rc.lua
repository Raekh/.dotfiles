local status, _ = pcall(require, 'symbols-outline')
if (not status) then return end

require'symbols-outline'.setup()
