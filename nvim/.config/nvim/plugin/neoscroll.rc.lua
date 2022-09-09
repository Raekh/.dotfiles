local status, neoscroll = pcall(require, 'neoscroll')
if (not status and not neoscroll) then return end

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '50', [['sine']]}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '50', [['sine']]}}
-- Use the "circular" easing function
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '50', [['circular']]}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '50', [['circular']]}}
-- Pass "nil" to disable the easing animation (constant scrolling speed)
t['<C-y>'] = {'scroll', {'-0.10', 'false', '50', nil}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '50', nil}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'50'}}
t['zz']    = {'zz', {'50'}}
t['zb']    = {'zb', {'50'}}


require'neoscroll'.setup({
    hide_cursor = true,
    stop_eof = true,
    respect_scrolloff = true,
    cursor_scrolls_alone = true,
    easing_function = 'quadratic'
})

require'neoscroll.config'.set_mappings(t);

