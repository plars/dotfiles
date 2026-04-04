-- remap opt=vim.opt for convenience
local opt = vim.opt

opt.colorcolumn = '80'
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.signcolumn = "yes"

-- Search options
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- ...unless the search string has capital letters
opt.hlsearch = true   -- highlight search matches

-- Whitespace options
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for

