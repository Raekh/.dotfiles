return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.event_handlers = opts.event_handlers or {}
    table.insert(opts.event_handlers, {
      event = "neo_tree_popup_input_ready",
      ---@param args { bufnr: integer, winid: integer }
      handler = function(args)
        -- map <esc> to enter normal mode (by default closes prompt)
        -- don't forget `opts.buffer` to specify the buffer of the popup.
        vim.keymap.set("i", "jk", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
        vim.keymap.set("i", "jj", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
      end,
    })
  end,
}
