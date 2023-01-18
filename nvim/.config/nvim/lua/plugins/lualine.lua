return {
    "nvim-lualine/lualine.nvim",
    after = {
        "folke/noice.nvim",
        "folke/tokyonight.nvim"
    },
    config = function()
            local noice = require('noice')

            require('lualine').setup({
            options = {
                icons_enabled = true,
                -- theme = 'gruvbox',
                theme = 'tokyonight',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {}
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { {
                    'filename',
                    file_status = true, -- displays file status (readonly status, modified status)
                    path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
                } },
                lualine_x = {
                    "import",
                    {
                        'diagnostics',
                        sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
                    },
                    'encoding',
                    'filetype',
                    {
                        noice.api.status.message.get_hl,
                        cond = noice.api.status.message.has,
                    },
                    {
                        noice.api.status.command.get,
                        cond = noice.api.status.command.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        noice.api.status.mode.get,
                        cond = noice.api.status.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        noice.api.status.search.get,
                        cond = noice.api.status.search.has,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
                },	inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {{
                        'filename',
                        file_status = true,
                        path = 1 -- 1 = relative path
                    }},
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = { 'fugitive' }
            })
    end
}
