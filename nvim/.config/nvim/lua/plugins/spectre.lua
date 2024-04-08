return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<Leader>RR", '<CMD>lua require("spectre").toggle()<CR>', desc = "Spectre: Toggle" },
    { "<Leader>Rw", '<CMD>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Spectre: Search current word" },
    { "<Leader>Rw", '<ESC><CMD>lua require("spectre").open_visual()<CR>', mode = 'v', desc = "Spectre: Search current word" },
    { "<Leader>Rp", '<CMD>lua require("specter").open_file_search({select_word=true})<CR>', desc = "Spectre: Search on current file" }
  }
}

