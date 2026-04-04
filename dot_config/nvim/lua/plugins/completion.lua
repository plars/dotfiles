return {
  "saghen/blink.cmp",
  version = "*",
  lazy = false,
  opts = {
    keymap = { preset = "default" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
      list = { selection = { preselect = false } },
      menu = { auto_show = true },
      trigger = { show_on_trigger_character = true },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
  },
}
