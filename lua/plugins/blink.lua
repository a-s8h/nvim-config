return {
  'saghen/blink.cmp',
  opts = {
    keymap = { preset = 'super-tab' },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = { documentation = { auto_show = true } },
    sources = {
      default = { 'lsp', 'path', 'snippets' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  }
 }
