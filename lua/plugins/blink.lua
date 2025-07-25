return {
  'saghen/blink.cmp',
  build = 'cargo build --release',
  opts = {
    keymap = { preset = 'enter' },
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
