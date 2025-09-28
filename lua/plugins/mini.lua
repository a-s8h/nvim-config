return {
    {
        "echasnovski/mini.surround",
        version = false,
        opts = {
            mappings = {
                add          = "ma", 
                delete       = "md",
                find         = "mf",
                find_left    = "mF",
                highlight    = "mh",
                replace      = "mr",
                update_n_lines = "mn",
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
