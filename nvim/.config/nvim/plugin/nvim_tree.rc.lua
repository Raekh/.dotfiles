local status, nt = pcall(require, "nvim-tree")
if (not status) then return end

nt.setup({
    filters = { custom = { "^.git$" } }
})

vim.keymap.set("n", ";nt", "<Cmd>NvimTreeToggle<CR>")
