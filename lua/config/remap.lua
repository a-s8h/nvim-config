vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join current line with the next
vim.keymap.set("n", "J", "mzJ`z")

-- scorlling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search results centered 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- so duplicate line uses the same cursor position
vim.keymap.set("n", "yyp", function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0)) -- save pos
    vim.cmd("normal! yyp")                                   -- duplicate
  vim.api.nvim_win_set_cursor(0, { line + 1, col })        -- move down, same col
end, { desc = "Duplicate line below (same column)" })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "<M-q>", function()
  local wininfo = vim.fn.getwininfo()
  for _, win in ipairs(wininfo) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end, { desc = "Toggle Quickfix" })
