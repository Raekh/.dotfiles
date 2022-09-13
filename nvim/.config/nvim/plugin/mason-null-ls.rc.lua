local status, _ = pcall(require, 'mason-null-ls')
if (not status) then return end

require'mason-null-ls'.setup({
    automatic_installation = true,
})

require'mason-null-ls'.check_install(true)
