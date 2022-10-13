local status, close_buffers = pcall(require, 'close_buffers')
if (not status) then return end

close_buffers.setup({

})
