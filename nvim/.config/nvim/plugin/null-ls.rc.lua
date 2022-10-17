local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local function buffer_augroup(group, bufnr, cmds)
    vim.api.nvim_create_augroup(group, { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
    for _, cmd in ipairs(cmds) do
        local event = cmd.vent
        cmd.event = nil
        vim.api.nvim_create_autocmd(event, vim.tbl_extend("keep", { group = group, buffer = bufnr }, cmd))
    end
end

---@diagnostic disable-next-line: redundant-parameter
require 'null-ls'.setup({
    -- on_exit = function(client, bufnr)
    --     vim.lsp.buf_detach_client(bufnr, client.id)
    -- end,
    on_attach = function(client, bufnr)
        -- local detach = function ()
        --     vim.lsp.buf_detach_client(bufnr, client.id)
        -- end
        -- buffer_augroup('entropitor:lsp:closing', bufnr, {
        --     { event = "BufDelete", callback = detach }
        -- })
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
            -- Maybe disable this and put it in a callable vim keymap
        end
    end,
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
        null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.code_actions.gitsigns,
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
