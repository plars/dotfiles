return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- In the current main branch, setup() only accepts install_dir.
    -- Highlighting, indent etc. are handled by Neovim 0.12's built-in treesitter.
    require("nvim-treesitter").setup()
    require("nvim-treesitter.install").install({
      "python", "go", "rust", "bash", "lua", "vim", "vimdoc",
    })
  end,
}
