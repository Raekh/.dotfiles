local completion_callback = require'completion'.on_attach

require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
})

require'lspconfig'.tsserver.setup{ on_attach=completion_callback }

require'lspconfig'.clangd.setup{
    on_attach=completion_callback,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.pyls.setup{ on_attach=completion_callback }
require'lspconfig'.svelte.setup{ on_attach=completion_callback }
require'lspconfig'.yamlls.setup{ on_attach=completion_callback }

require'lspconfig'.gopls.setup{
    on_attach=completion_callback,
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
