return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        "plenary",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    },
    config = function()
        require('telescope').setup({
            pickers = {
                find_files = {
                    theme = 'dropdown',
                }
            }
        })
        require('telescope').load_extension('fzf')
        local builtin = require('telescope/builtin')
        vim.keymap.set('n', '<leader>p', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
