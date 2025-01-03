return {
    -- File Explorer
    { "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons", config = function()
        require("nvim-tree").setup()
    end },

    -- Autocompletion and LSP
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",

    -- GitHub Copilot
    "github/copilot.vim",

    -- Syntax Highlighting and Folding
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "python", "javascript", "html", "lua" },
            highlight = { enable = true },
        })
    end },

    { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async", event = "VeryLazy", config = function()
        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local totalLines = vim.api.nvim_buf_line_count(0)
            local foldedLines = endLnum - lnum
            local suffix = (" ⇲ %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0

            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end

            suffix = (" "):rep(math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)) .. suffix
            table.insert(newVirtText, { suffix, "MoreMsg" })
            return newVirtText
        end

        require("ufo").setup({
            fold_virt_text_handler = handler,
            preview = {
                win_config = {
                    border = { "", "─", "", "", "", "─", "", "" },
                    winblend = 0,
                },
                mappings = {
                    scrollU = "<C-u>",
                    scrollD = "<C-d>",
                    jumpTop = "[",
                    jumpBot = "]",
                },
            },
        })

        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
        vim.keymap.set("n", "K", function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
                vim.cmd [[ Lspsaga hover_doc ]]
            end
        end)
    end },

    -- Auto Save
    { "Pocco81/auto-save.nvim", config = function()
        require("auto-save").setup()
    end },

    -- Terminal Integration
    { "akinsho/toggleterm.nvim", config = function()
        require("toggleterm").setup()
    end },

    -- Theming Support (Atom One Dark)
    { "navarasu/onedark.nvim", config = function()
        require("onedark").setup({ style = "darker" })
        require("onedark").load()
    end },

    -- Tabs and Buffers
    { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons", config = function()
        require("bufferline").setup()
    end },

    -- LSP Pictograms
    { "onsails/lspkind.nvim" },
}
