import('nvim-tree', function(nt)
    nt.setup({
        sort_by = "type",
        filters = { custom = { "^.git$" } },
        view = {
            adaptive_size = true,
            mappings = {
                list = {
                    { key = "h", action = "dir_up" },
                },
            },
        },
        renderer = {
            group_empty = true,
            highlight_opened_files = "all"
        }
    })

    vim.keymap.set("n", ";nt", "<Cmd>NvimTreeToggle<CR>")
    vim.keymap.set("n", ";nf", "<Cmd>NvimTreeFindFile<CR>")
end)
