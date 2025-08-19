return { 
  "ibhagwan/fzf-lua",
  config = function()
    local fzf     = require("fzf-lua")
    local actions = require("fzf-lua.actions")

    fzf.setup({
        keymap = {
            fzf = {
                ["ctrl-q"] = "select-all+accept",
            },
        },
    })

    fzf.register_ui_select()

    vim.keymap.set("n", "<C-p>", fzf.files, { desc = "Find Files" })
    vim.keymap.set("n", "<C-f>", fzf.live_grep, { desc = "Live Grep" }) 
    vim.keymap.set("n", "gra",  fzf.lsp_code_actions, { desc = "LSP Code Actions" })
    vim.keymap.set("n", "grs",  fzf.lsp_live_workspace_symbols, { desc = "LSP Symbols" })
  end
}
