-- General Settings
vim.o.number = true          -- Enable line numbers
vim.o.mouse = "a"            -- Enable mouse support
vim.cmd("syntax enable")     -- Enable syntax highlighting
vim.o.termguicolors = true   -- Enable 24-bit RGB colors

-- Theme Setup (Atom One Dark)
require("onedark").setup({ style = "darker" })
require("onedark").load()
