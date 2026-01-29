local M = {}

local ns = vim.api.nvim_create_namespace "ShowTypeVirtualText"

function M.show_type()
  local bufnr = vim.api.nvim_get_current_buf()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1

  -- Clear previous virtual text
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local params = vim.lsp.util.make_position_params()

  vim.lsp.buf_request(bufnr, "textDocument/hover", params, function(_, result)
    if not result or not result.contents then return end

    local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    if vim.tbl_isempty(lines) then return end

    local text = table.concat(lines, " "):gsub("%s+", " "):sub(1, 120)

    vim.api.nvim_buf_set_extmark(bufnr, ns, row, 0, {
      virt_text = { { " " .. text, "Comment" } },
      virt_text_pos = "eol",
    })
  end)
end

-- Auto clear when cursor moves
vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
  callback = function() vim.api.nvim_buf_clear_namespace(0, ns, 0, -1) end,
})

return M
