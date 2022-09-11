local status,_ = pcall(require, 'notifier')
if (not status) then return end

require'notifier'.setup{}
