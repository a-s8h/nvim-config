return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        'rouge8/neotest-rust',
    },
    config = function()
        local neotest = require('neotest')
        neotest.setup({
            adapters = {
                require('neotest-rust')
            },
            icons = {
                running_animated = {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"},
                passed = "😊",
                running = "🥱",
                failed = "😔",
                skipped = "💤",
                unknown = "🤔",
                non_collapsible = "─",
                collapsed = "─",
                expanded = "╮",
                child_prefix = "├",
                final_child_prefix = "╰",
                child_indent = "│",
                final_child_indent = " ",
                watching = "👀",
            },
        })
        vim.keymap.set('n', '<leader>tr', neotest.run.run)
        vim.keymap.set('n', '<leader>ta', function() neotest.run.run(vim.fn.expand('%')) end)
        vim.keymap.set('n', '<leader>td', function() neotest.run.run({ strategy = 'dap' }) end)
        vim.keymap.set('n', '<leader>ts', neotest.run.stop)
    end
}
