local status,_ = pcall(require, 'lab')
if (not status) then return end

return true -- Until node 14.0 is supported, or workaround

-- require'lab'.setup {
--     code_runner = {
--         enabled = true,
--     },
--     quick_data = {
--         enabled = true,
--     }
-- }
