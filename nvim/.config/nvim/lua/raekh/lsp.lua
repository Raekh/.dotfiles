local completion_callback = require'completion'.on_attach

-- require("lsp-colors").setup({
--     Error = "#db4b4b",
--     Warning = "#e0af68",
--     Information = "#0db9d7",
--     Hint = "#10B981"
-- })

vim.fn.sign_define("LspDiagnosticsSignError",
    {text = "", texthl = "GruvboxRed"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
    {text = "", texthl = "GruvboxYellow"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
    {text = "", texthl = "GruvboxBlue"})
vim.fn.sign_define("LspDiagnosticsSignHint",
    {text = "", texthl = "GruvboxAqua"})

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

local saga = require 'lspsaga'
saga.init_lsp_saga()
