--- @type LazySpec
return {
  "yochem/jq-playground.nvim", -- JQ playground
  {
    -- Curl playground
    "oysandvik94/curl.nvim",
    cmd = { "CurlOpen" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
}
