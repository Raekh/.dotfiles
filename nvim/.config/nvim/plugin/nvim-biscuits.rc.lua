local status, biscuits = pcall(require, "nvim-biscuits")
if (not status) then return end

biscuits.setup({
    toggle_keybind = ";cb",
    prefix_string = " 📎 "
})
