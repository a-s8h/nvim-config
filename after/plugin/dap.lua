local dap = require('dap')

dap.adapters.codelldb = {
    type = 'server',
    port = 13000,
    executable = {
        command = '/usr/local/codelldb/extension/adapter/codelldb',
        args = {'--port', '13000'},
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>dj', dap.step_over)
vim.keymap.set('n', '<leader>dl', dap.step_into)
vim.keymap.set('n', '<leader>dr', dap.repl.open)


local dapui = require('dapui')
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

