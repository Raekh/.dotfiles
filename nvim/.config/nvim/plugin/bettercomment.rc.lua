local status,_ = pcall(require, 'better-comment')
if (not status) then return end

require'better-comment'.Setup()
