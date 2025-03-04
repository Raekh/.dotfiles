return {
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    lazy = false,
    config = function()
      require("tabnine").setup {
        disable_auto_comment = true,
        accept_keymap = "<Right>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 200,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt", "NvimTree" },
        log_file_path = nil, -- absolute path to Tabnine log file
      }
    end,
    keys = {
      { "<Leader>T", name = "Tabnine" },
      { "<Leader>To", "<CMD>TabnineChat<CR>", desc = "TabnineChat: Open" },
      { "<Leader>TC", "<CMD>TabnineChatClose<CR>", desc = "TabnineChat: Close" },
      { "<Leader>Tn", "<CMD>TabnineChatNew<CR>", desc = "TabnineChat: New chat" },
      { "<Leader>Ta", "<CMD>TabnineAccept<CR>", desc = "TabnineChat: Accept" },
      { "<Leader>Tr", "<CMD>TabnineReject<CR>", desc = "TabnineChat: Reject" },
    },
  },
}
