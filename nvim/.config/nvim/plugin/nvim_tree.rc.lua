local status, nt = pcall(require, "nvim-tree")
if (not status) then return end

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
