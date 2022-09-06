local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
	options = {
		mode = 'buffers',
		numbers = 'ordinal',
		show_tab_indicators = true,
        max_name_length = 30,
        max_prefix_length = 20,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		name_formatter = function(buf)
			if buf.name:match('%.md') then
				return vim.fn.fnamemodify(buf.name, ':t:r')
			end
		end,
		-- separator_style = 'slant',
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true
	},
	--[[
	highlights = {
		separator = {
			guifg = '#073642',
			guibg = '#002b36',
		},
		separator_selected = {
			guifg = '#073642',
		},
		background = {
			guifg = '#657b83',
			guibg = '#002b36',
		},
		buffer_selected = {
			guifg = '#fdf6e3',
			gui = 'bold',
		},
		fill = {
			guibg = '#073642'
		}
	}
	--]]
}

vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>BufferLineCycleNext<CR>', {})
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>BufferLineCyclePrev<CR>', {})
vim.api.nvim_set_keymap('n', '<C-x>', '<cmd>bdelete<CR>', {})
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>enew<CR>', {})
