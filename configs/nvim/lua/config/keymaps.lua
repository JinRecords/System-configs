vim.g.mapleader = " ",
-- Key mappings for File Explorer (Nvim Tree)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Key mappings for Terminal Integration (ToggleTerm)
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Key mappings for Bufferline (Tabs and Buffers)
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })

-- Copilot setup
vim.g.copilot_no_tab_map = true,
vim.api.nvim_set_keymap("i", "<C-/>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

-- Key mappings for running code based on filetype
vim.keymap.set("n", "<leader>r", function()
    vim.cmd("w")  -- Save the current file

    local filetype = vim.bo.filetype
    local commands = {
        python = "python3 %",
        javascript = "node %",
        typescript = "ts-node %",
        html = "open %",
        lua = "lua %",
        bash = "bash %",
        go = "go run %",
        java = "java %",
        c = "gcc % -o %:r && ./%:r",
        cpp = "g++ % -o %:r && ./%:r",
    }

    local command = commands[filetype]

    if command then
        vim.cmd("!" .. command)  -- Run the command
    else
        print("No run command defined for filetype: " .. filetype)  -- Notify if no command is defined
    end
end, { desc = "Run Code Dynamically Based on Filetype" })

-- Scroll Wheel Setup for horizontal scrolling
vim.api.nvim_set_keymap('n', '<ScrollWheelLeft>', '5zh', { noremap = true, silent = true })  -- Scroll left by 5 columns
vim.api.nvim_set_keymap('n', '<ScrollWheelRight>', '5zl', { noremap = true, silent = true })  -- Scroll right by 5 columns

-- Key mappings for UFO folding
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open All Folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close All Folds" })
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open Folds Except Kinds" })
vim.keymap.set("n", "K", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
        vim.cmd [[ Lspsaga hover_doc ]]  -- Show hover documentation if no folded lines
    end
end, { desc = "Peek Folded Lines Under Cursor" })

-- General Key Mappings
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })  -- File Explorer
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })  -- Terminal Integration

-- Bufferline Key Mappings
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })  -- Next Buffer
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })  -- Previous Buffer

-- Code Execution Key Mapping
vim.keymap.set("n", "<leader>r", function()
    vim.cmd("w")  -- Save the current file

    local filetype = vim.bo.filetype
    local commands = {
        python = "python3 %",
        javascript = "node %",
        typescript = "ts-node %",
        html = "open %",
        lua = "lua %",
        bash = "bash %",
        go = "go run %",
        java = "java %",
        c = "gcc % -o %:r && ./%:r",
        cpp = "g++ % -o %:r && ./%:r",
    }

    local command = commands[filetype]

    if command then
        vim.cmd("!" .. command)  -- Run the command for the current file type
    else
        print("No run command defined for filetype: " .. filetype)  -- Notify if no command is defined
    end
end, { desc = "Run Code Dynamically Based on Filetype" })

-- Scroll Wheel Setup for horizontal scrolling
vim.api.nvim_set_keymap('n', '<ScrollWheelLeft>', '5zh', { noremap = true, silent = true })  -- Scroll left by 5 columns
vim.api.nvim_set_keymap('n', '<ScrollWheelRight>', '5zl', { noremap = true, silent = true })  -- Scroll right by 5 columns

-- Yank to System Clipboard in Visual Mode
vim.api.nvim_set_keymap('v', '<D-s-c>', '"+y', { noremap = true, silent = true })  -- Yank to system clipboard

vim.api.nvim_set_keymap('i', '<M-Backspace>', '<C-w>', { noremap = true, silent = true })  -- Map Option + Backspace to delete a word

-- Additional key mappings can be added here...
