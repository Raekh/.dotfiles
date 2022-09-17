local status, gi = pcall(require, "guess-indent")
if (not status) then return end

gi.setup()
