local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            -- vim.api.nvim_command [[ augroup Format ]]
            -- vim.api.nvim_command [[ autocmd! * <buffer> ]]
            -- vim.api.nvim_command [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
            -- vim.api.nvim_command [[ augroup END ]]
            vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup_format,
                buffer = 0,
                callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end
            })
        end
    end,
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
        null_ls.builtins.formatting.prettierd
    }
})

-- require 'eslint'.setup({
--     bin = 'eslint_d', -- or `eslint_d`
--     code_actions = {
--         enable = true,
--         apply_on_save = {
--             enable = true,
--             types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
--         },
--         disable_rule_comment = {
--             enable = true,
--             location = "separate_line", -- or `same_line`
--         },
--     },
--     diagnostics = {
--         enable = true,
--         report_unused_disable_directives = false,
--         run_on = "type", -- or `save`
--     },
-- })
