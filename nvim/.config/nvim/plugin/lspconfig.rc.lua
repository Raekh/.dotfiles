local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

vim.diagnostic.config {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert  = true,
    severity_sort = false
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl})
end


local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        return true
        -- vim.api.nvim_command [[augroup Format]]
        -- vim.api.nvim_command [[autocmd! * <buffer>]]
        -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        -- vim.api.nvim_command [[augroup END]]
    end
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the 'vim' global
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            }
        }
    }
}

-- nvim_lsp.eslint.setup {
--     on_attach = on_attach,
-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.tsx", },
-- 	cmd = { "eslint", "--stdio"},
-- }

-- nvim_lsp.eslint.setup {
-- 	on_attach = on_attach,
-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.tsx", },
-- 	-- cmd = { "eslint_d",  "--stdin", "--fix-to-stdout", "--stdin-filename", "%filepath" },
-- 	cmd = { "eslint_d", "%filepath", "--fix"},
-- }
