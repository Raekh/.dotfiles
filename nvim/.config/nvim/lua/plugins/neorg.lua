return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    opts = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    version = "*",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.summary"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.export"] = {},
          ["core.export.markdown"] = {},
          ["core.latex.renderer"] = {},
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            },
          },
          ["core.text-objects"] = {},
          ["core.ui.calendar"] = {},
          ["core.neorgcmd"] = {},
          ["core.tempus"] = {},
          ["core.syntax"] = {},
          ["core.ui"] = {},
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
