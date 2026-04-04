-- clipboard is shared with neovims but not system
vim.api.nvim_set_option("clipboard", "unnamed")

require("config/lazy")
require("config/options")
require("config/lsp")
--require("mason").setup()
--require("mason-lspconfig").setup()
