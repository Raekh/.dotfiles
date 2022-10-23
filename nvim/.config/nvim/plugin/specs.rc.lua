local status, specs = pcall(require, 'specs')
if (not status) then
    vim.notify('specs not found', vim.log.levels.WARN)
end

specs.setup({})
