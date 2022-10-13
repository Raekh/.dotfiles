local status, delaytrain = pcall(require, 'delaytrain')
if (not status) then return end

delaytrain.setup()
