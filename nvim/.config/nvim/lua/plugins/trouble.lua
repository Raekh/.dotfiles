return {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
        { ";pt", "<Cmd>TroubleToggle<CR>",  desc = "Toggle Trouble" },
        { ";pr", "<Cmd>TroubleRefresh<CR>", desc = "Refresh Trouble" },
        { ";pc", "<Cmd>TroubleClose<CR>",   desc = "Close Trouble" },
    },
    config = true,
}
