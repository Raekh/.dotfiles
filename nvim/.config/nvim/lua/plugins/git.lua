-- vim:foldmethod=marker
--- @type LazySpec
return {
  {
    {
      -- Best git diff tool to exist on the planet
      -- Using local fork with hunk_links feature
      dir = "/home/raekh/Documents/Code/diffview-graphs/diffview.nvim",
      name = "diffview.nvim",
      lazy = false,
      config = function()
        local set = vim.opt -- set options
        -- set.fillchars = set.fillchars + "diff:╱"
        set.fillchars = set.fillchars + "diff:╱"

        require("diffview").setup {
          hunk_links = {
            enabled = true,
            style = "round", -- "round", "hard", "simple", or "block"
          },
        }

        -- Color overrides {{{
        -- local current = vim.api.nvim_get_hl(0, { name = "DiffDelete" })
        -- vim.api.nvim_set_hl(0, "DiffDelete", {
        --   fg = "#37222c",
        --   bg = current.bg,
        --   bold = current.bold,
        --   italic = current.italic,
        --   underline = current.underline,
        --   reverse = current.reverse,
        --   blend = current.blend,
        -- })
        -- }}}
      end,
      keys = {
        { "<Leader>Do", "<CMD>DiffviewOpen<CR>", desc = "Diffview: Open" },
        { "<Leader>Dc", "<CMD>DiffviewClose<CR>", desc = "Diffview: Close" },
        { "<Leader>Dl", "<CMD>DiffviewLog<CR>", desc = "Diffview: Log" },
        { "<Leader>Dr", "<CMD>DiffviewRefresh<CR>", desc = "Diffview: Refresh" },
        { "<Leader>Df", "<CMD>DiffviewFocusFiles<CR>", desc = "Diffview: Focus files" },
        { "<Leader>Dh", "<CMD>DiffviewFileHistory<CR>", desc = "Diffview: File history" },
        { "<Leader>DH", "<CMD>DiffviewFileHistory %<CR>", desc = "Diffview: Current file history" },
        { "<Leader>Dt", "<CMD>DiffviewToggleFiles<CR>", desc = "Diffview: Toggle files" },
      },
    },
    {
      -- Gitlab toolkit
      "harrisoncramer/gitlab.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        -- "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
        "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
      },
      enabled = true,
      build = function() require("gitlab.server").build(true) end, -- Builds the Go binary
      config = function()
        require("gitlab").setup {
          discussion_signs = {
            virtual_text = true,
          },
        }
      end,
    },
  },
}
