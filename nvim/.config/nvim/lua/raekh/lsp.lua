local function on_attach()
end


require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.clangd.setup{
    on_attach=on_attach,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.pyls.setup{ on_attach=on_attach }
require'lspconfig'.svelte.setup{}
require'lspconfig'.yamlls.setup{}

require'lspconfig'.gopls.setup{
    on_attach=on_attach,
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

-- require'lspconfig'.rust_analyser.setup{ on_attach=on_attach }

local opts = {
    highlight_hovered_item = true,
    show_guides = true,
}

require('symbols-outline').setup(opts)
