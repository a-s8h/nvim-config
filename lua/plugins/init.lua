return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({})
		    vim.o.background = "dark"
            vim.cmd("colorscheme gruvbox")
        end,
    },
    { "nvim-lua/plenary.nvim", name = "plenary" },
    "tpope/vim-fugitive",
}
