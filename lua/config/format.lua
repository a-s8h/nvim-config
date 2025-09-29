vim.keymap.set("n", "<leader>f", function()
  local ft = vim.bo.filetype
  if ft == "rust" or ft == "zig" then
    vim.lsp.buf.format({ async = true, timeout_ms = 2000 })
  elseif ft == "typescript" or ft == "javascript" then
    local file = vim.fn.expand("%")
    vim.fn.jobstart({ "npx", "prettier", "--write", file }, {
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          local row, col = unpack(vim.api.nvim_win_get_cursor(0))
          vim.cmd("checktime")
          vim.api.nvim_win_set_cursor(0, {row, col})
        else
          print("Prettier failed")
        end
      end,
    })
  end
end, { noremap = true, silent = true })

