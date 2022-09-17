local status, sb = pcall(require, 'scrollbar')
if (not status) then return end

sb.setup()
