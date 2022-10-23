local status, coverage = pcall(require, 'coverage')
if (not status) then
    vim.notify("nvim-coverage not found")
    return
end

coverage.setup()
