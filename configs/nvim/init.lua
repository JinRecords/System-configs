-- Load lazy.nvim
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup(require("config.plugins"))

-- Load general settings and keymaps
require("config.general")
require("config.keymaps")

