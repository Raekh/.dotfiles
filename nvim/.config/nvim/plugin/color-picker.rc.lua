local status, cp = pcall(require, "color-picker")
if (not status) then return end

cp.setup()
