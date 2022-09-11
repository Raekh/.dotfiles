local status, _ = pcall(require, 'autolist')
if (not status) then return end

require'autolist'.setup()
