return {
   "kyazdani42/nvim-tree.lua",
    keys = {
        {";nt", "<Cmd>NvimTreeToggle<CR>"},
        {";nf", "<Cmd>NvimTreeFindFile<CR>"}
    },
    opts = {
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
    }
}
