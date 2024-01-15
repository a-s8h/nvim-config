return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "tsserver",
            },
            handlers = {
                lsp_zero.default_setup,
            },
        })
        lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
        end)
    end
}
