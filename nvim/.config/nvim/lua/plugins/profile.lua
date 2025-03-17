if true then return {} end

return {
  "Kurama622/profile.nvim",
  dependencies = { "3rd/image.nvim" },
  config = function()
    require("profile").setup {
      avatar_path = "https://avatars.githubusercontent.com/u/24220353?v=4", -- default: profile.nvim/resources/profile.png
      user = "Raekh",
    }
    vim.api.nvim_set_keymap("n", "<leader>P", "<cmd>Profile<cr>", { silent = true })
  end,
}
