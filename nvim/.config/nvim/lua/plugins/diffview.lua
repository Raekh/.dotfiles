return {
  'sindrets/diffview.nvim',
  lazy = false,
  config = function()
    local set = vim.opt -- set options
    set.fillchars = set.fillchars + 'diff:╱'
  end,
  keys = {
    { "<Leader>Do", "<CMD>DiffviewOpen<CR>",          desc = "Diffview: Open" },
    { "<Leader>Dc", "<CMD>DiffviewClose<CR>",         desc = "Diffview: Close" },
    { "<Leader>Dl", "<CMD>DiffviewLog<CR>",           desc = "Diffview: Log" },
    { "<Leader>Dr", "<CMD>DiffviewRefresh<CR>",       desc = "Diffview: Refresh" },
    { "<Leader>Df", "<CMD>DiffviewFocusFiles<CR>",    desc = "Diffview: Focus files" },
    { "<Leader>Dh", "<CMD>DiffviewFileHistory<CR>",   desc = "Diffview: File history" },
    { "<Leader>DH", "<CMD>DiffviewFileHistory %<CR>", desc = "Diffview: Current file history" },
    { "<Leader>Dt", "<CMD>DiffviewToggleFiles<CR>",   desc = "Diffview: Toggle files" },
  }
}

