local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
	options = {
		mode = 'tabs',
		numbers = 'ordinal',
		show_tab_indicators = true,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		name_formatter = function(buf)
			if buf.name:match('%.md') then
				return vim.fn.fnamemodify(buf.name, ':t:r')
			end
		end,
		separator_style = 'slant',
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
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

vim.api.nvim_set_keymap('n', 'gt', '<cmd>BufferLineCycleNext<CR>', {})
vim.api.nvim_set_keymap('n', 'gT', '<cmd>BufferLineCyclePrev<CR>', {})
