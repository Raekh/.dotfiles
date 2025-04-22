-- vim:fileencoding=utf-8:foldmethod=marker
--- @type LazySpec
return {
  -- Neo-tree {{{
  { "mrbjarksen/neo-tree-diagnostics.nvim", lazy = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "mrbjarksen/neo-tree-diagnostics.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = function(_, opts)
      -- No idea why I have to redeclare icons/signs here...
      -- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      -- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      -- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      -- vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

      opts.sources = {
        "filesystem",
        "buffers",
        "git_status",
        "diagnostics",
      }
      opts.diagnostics = {
        bind_to_cwd = true,
        diag_sort_function = "severity",
        follow_current_file = { enabled = true },
        group_dirs_and_files = true,
        group_empty_dirs = true,
        show_unloaded = true,
        -- symbols = {
        --   hint = "󰌵",
        --   info = " ",
        --   warn = " ",
        --   error = " ",
        -- },
        highlights = {
          hint = "DiagnosticSignHint",
          info = "DiagnosticSignInfo",
          warn = "DiagnosticSignWarn",
          error = "DiagnosticSignError",
        },
        renderers = {
          file = {
            { "indent" },
            { "icon" },
            { "grouped_path" },
            { "name" },
            { "diagnostic_count", show_when_none = true },
            { "split_diagnostic_counts", left_padding = 1 },
            { "clipboard" },
          },
          diagnostic = {
            { "indent" },
            { "icon" },
            { "name" },
            { "source" },
            { "code" },
            { "position" },
          },
        },
      }
      -- print(vim.inspect(opts.diagnostics))
      -- opts.event_handlers = opts.event_handlers or {}
      -- table.insert(opts.event_handlers, {
      --   event = "neo_tree_popup_input_ready",
      --   ---@param args { bufnr: integer, winid: integer }
      --   handler = function(args)
      --     -- map <esc> to enter normal mode (by default closes prompt)
      --     -- don't forget `opts.buffer` to specify the buffer of the popup.
      --     vim.keymap.set("i", "jk", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
      --     vim.keymap.set("i", "jj", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
      --   end,
      -- })
    end,
  },
  -- }}}
}
