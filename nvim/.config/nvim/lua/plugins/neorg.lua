return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    opts = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = {
      "luarocks.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neorg/neorg-telescope",
    },
    version = "*",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            -- config = {
            --   icon_preset = "varied",
            --   icons = {
            --     delimiter = {
            --       horizontal_line = {
            --         highlight = "@neorg.delimiters.horizontal_line",
            --       },
            --     },
            --     code_block = {
            --       -- If true will only dim the content of the code block (without the
            --       -- `@code` and `@end` lines), not the entirety of the code block itself.
            --       content_only = true,
            --
            --       -- The width to use for code block backgrounds.
            --       --
            --       -- When set to `fullwidth` (the default), will create a background
            --       -- that spans the width of the buffer.
            --       --
            --       -- When set to `content`, will only span as far as the longest line
            --       -- within the code block.
            --       -- width = "content",
            --       width = "fullwidth",
            --
            --       -- Additional padding to apply to either the left or the right. Making
            --       -- these values negative is considered undefined behaviour (it is
            --       -- likely to work, but it's not officially supported).
            --       padding = {
            --         left = 20,
            --         right = 20,
            --       },
            --
            --       -- If `true` will conceal (hide) the `@code` and `@end` portion of the code
            --       -- block.
            --       conceal = true,
            --
            --       nodes = { "ranged_verbatim_tag" },
            --       highlight = "CursorLine",
            --       -- render = module.public.icon_renderers.render_code_block,
            --       insert_enabled = true,
            --     },
            --   },
            -- },
          },
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
          ["core.latex.renderer"] = {
            config = {
              conceal = true,
              debounce_ms = 200,
              dpi = 350,
              min_length = 3,
              render_on_enter = true,
              renderer = "core.integrations.image",
              scale = 1,
            },
          },
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
          ["core.integrations.treesitter"] = {},
          ["core.integrations.telescope"] = {},
          ["core.autocommands"] = {},
          ["core.highlights"] = {},
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
