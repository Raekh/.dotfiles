import({'mason', 'mason-lspconfig'}, function(modules)
    local mason = modules.mason
    local lspconfig = modules['mason-lspconfig']

    mason.setup {}
    lspconfig.setup {
        ensure_installed = {}
    }
end)
