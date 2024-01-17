return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = false,
                debounce = 300,
                keymap = {
                    accept = '<M-y>',
                    next = '<M-f>',
                    back = '<M-b>',
                    dismiss = '<M-d>',
                }
            }
        })
    end,
}
