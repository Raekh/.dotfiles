import('easypick', function(easypick)
    easypick.setup({
        pickers = {
            {
                -- name for your custom picker
                name = 'ls',
                -- command to execute, output has to be a list of plain list entries
                command = 'ls',
                -- specify custom previewer, or one of the default ones
                previewer = easypick.previewers.default()
            },
        }
    })
end)

