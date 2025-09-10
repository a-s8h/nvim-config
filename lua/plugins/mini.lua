return {
    {
        "echasnovski/mini.surround",
        version = false,
        opts = {
            mappings = {
                add          = "<leader>sa", 
                delete       = "<leader>sd",
                find         = "<leader>sf",
                find_left    = "<leader>sF",
                highlight    = "<leader>sh",
                replace      = "<leader>sr",
                update_n_lines = "<leader>sn",
            },
        },
    },
    { 
        'echasnovski/mini.pairs',
        version = '*',
        config = function()
            require('mini.pairs').setup()
        end
    },
    {
        'echasnovski/mini.comment',
        version = '*',
        config = function()
            require('mini.comment').setup()
        end
    },
}
