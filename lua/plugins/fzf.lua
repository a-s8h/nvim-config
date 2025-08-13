return { 
  "ibhagwan/fzf-lua",
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
    require("fzf-lua").register_ui_select()
    vim.keymap.set("n", "<c-p>", require('fzf-lua').files, { desc = "Fzf Files" })
    vim.keymap.set("n", "<c-F>", require('fzf-lua').live_grep, { desc = "Grep" })
    vim.keymap.set("n", "grr", require('fzf-lua').lsp_references, { desc = "Refs" })
    vim.keymap.set("n", "gri", require('fzf-lua').lsp_implementations, { desc = "Implementations" })
    vim.keymap.set("n", "grt", require('fzf-lua').lsp_typedefs, { desc = "Type definitions" })
    vim.keymap.set("n", "grd", require('fzf-lua').lsp_definitions, { desc = "Definitions" })
    vim.keymap.set("n", "gra", require('fzf-lua').lsp_code_actions, { desc = "Code actions" })
    vim.keymap.set("n", "grs", require('fzf-lua').lsp_live_workspace_symbols, { desc = "Symbols" })
  end
}
