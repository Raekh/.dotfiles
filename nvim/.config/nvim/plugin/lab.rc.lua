local status,_ = pcall(require, 'lab')
if (not status) then return end

require'lab'.setup {
    code_runner = {
        enabled = true,
    },
    quick_data = {
        enabled = true,
    }
}
