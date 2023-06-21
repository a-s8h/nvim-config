local neotest = require('neotest')

neotest.setup({
    adapters = {
        require('neotest-rust')
    }
})

vim.keymap.set('n', '<leader>tr', neotest.run.run)
vim.keymap.set('n', '<leader>ta', function() neotest.run.run(vim.fn.expand('%')) end)
vim.keymap.set('n', '<leader>td', function() neotest.run.run({strategy = 'dap'}) end)
vim.keymap.set('n', '<leader>ts', neotest.run.stop)
vim.keymap.set('n', '<leader>tw', neotest.summary.toggle)
vim.keymap.set('n', '<leader>to', neotest.output_panel.toggle)


