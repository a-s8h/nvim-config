return { 
  "ibhagwan/fzf-lua",
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
    vim.keymap.set("n", "<c-p>", require('fzf-lua').files, { desc = "Fzf Files" })
    vim.keymap.set("n", "<c-F>", require('fzf-lua').live_grep, { desc = "Grep" })
  end
}
