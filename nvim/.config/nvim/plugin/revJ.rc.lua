local status, revj = pcall(require, "revj")
if (not status) then return end

revj.setup({
    keymaps = {
        operator = '<Leader>J', -- for operator (+motion)
        line = '<Leader>j', -- for formatting current line
        visual = '<Leader>j', -- for formatting visual selection
    },
})
