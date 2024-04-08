return {
  'lambdalisue/suda.vim',
  lazy = false,
  config = function()
    -- vim.g.suda_prompt = 'Pasuwodo: '
    -- vim.g.suda_smart_edit = 1
    vim.g['suda#prompt'] = '[$->#]{ '
    vim.g['suda_smart_edit'] = 1
  end,

}

