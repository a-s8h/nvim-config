return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  config = function()
    require("no-neck-pain").setup({
      -- не меняем цвета, используем системные/дефолтные
      width = 100,  -- ширина центрального окна (можно подстроить под свой экран)
      buffers = {
        left = { enabled = true },   -- включаем левый пустой буфер
        right = { enabled = true },  -- включаем правый пустой буфер
      },
      debug = false,  -- без отладочной информации
    })
  end,
}
