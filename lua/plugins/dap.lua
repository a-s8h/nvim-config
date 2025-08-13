return {
    'mfussenegger/nvim-dap',
    dependencies = {
        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            dependencies = {
                'williamboman/mason.nvim',
                 config = function()
                     require('mason').setup()
                 end
            },
            opts = {
               ensure_installed = {
                    'js-debug-adapter',
                    'codelldb'
                }
            },
        },
        {
            "igorlfs/nvim-dap-view",
            ---@module 'dap-view'
            ---@type dapview.Config
            opts = {},
        },
    },
    config = function()
        local dap = require('dap')
        if not dap.adapters['pwa-node'] then
            require("dap").adapters["pwa-node"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "js-debug-adapter",
                    args = {
                         "${port}",
                    },
                },
            }
        end
        
        if not dap.adapters["node"] then
            dap.adapters["node"] = function(cb, config)
                if config.type == "node" then
                    config.type = "pwa-node"
               end
                local nativeAdapter = dap.adapters["pwa-node"]
                if type(nativeAdapter) == "function" then
                    nativeAdapter(cb, config)
                else
                    cb(nativeAdapter)
                end
            end
        end

        dap.configurations['javascript'] = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
            {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require("dap.utils").pick_process,
                cwd = "${workspaceFolder}",
            },
        }
        dap.configurations['typescript'] = dap.configurations['javascript']

        dap.adapters.codelldb = {
            type = 'server',
            port = 13000,
            executable = {
               command = 'codelldb',
               args = { '--port', '13000' },
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
        dap.configurations.zig = dap.configurations.cpp

        local dap_view = require('dap-view')
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
        vim.keymap.set('n', '<leader>dc', dap.continue)
        vim.keymap.set('n', '<leader>dj', dap.step_over)
        vim.keymap.set('n', '<leader>dl', dap.step_into)
        vim.keymap.set('n', '<leader>dr', dap.repl.open)
        vim.keymap.set('n', '<leader>dv', dap_view.toggle)
    end,
}
