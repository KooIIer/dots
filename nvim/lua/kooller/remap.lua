local wk = require("which-key")

wk.add({
    { "<A-Tab>", "<C-w>w", desc = "Next window", mode = "n" },
    { "<A-S-Tab>", "<C-w>W", desc = "Previous window", mode = "n" },

    { "<C-z>", "u", desc = "Undo", mode = "n" },
    { "<C-y>", "<C-r>", desc = "Redo", mode = "n" },
    { "<C-c>", '"+y', desc = "Copy to clipboard", mode = { "n", "v" } },
    { "<C-v>", '"+p', desc = "Paste from clipboard", mode = { "n", "v" } },
    { "<C-x>", '"+d', desc = "Cut to clipboard", mode = "v" },
    { "<C-x>", '"+dd', desc = "Cut line to clipboard", mode = "n" },

    { "t", "<cmd>Alpha<CR>", desc = "Open dashboard", mode = "n" },

    {
        "<C-/>",
        function() require("Comment.api").toggle.linewise.current() end,
        desc = "Toggle comment",
        mode = "n"
    },
    {
        "<C-/>",
        function() require("Comment.api").toggle.linewise(vim.fn.visualmode()) end,
        desc = "Toggle comment",
        mode = "v"
    },

    { "e", "a", mode = "n" },

    { "<leader>g", vim.lsp.buf.definition, desc = "Go to definition", mode = "n" },
    { "<leader>k", vim.lsp.buf.hover, desc = "Show hover info", mode = "n" },
    { "<leader>a", vim.lsp.buf.code_action, desc = "Code action", mode = "n" },
    { "<leader>r", vim.lsp.buf.references, desc = "Show references", mode = "n" },
    { "<leader>n", vim.lsp.buf.rename, desc = "Rename symbol", mode = "n" },
    { "<leader>d", vim.diagnostic.open_float, desc = "Show diagnostics", mode = "n" },
})

local function next_word_no_wrap()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local original_row = row
    local mode = vim.api.nvim_get_mode().mode

    if mode == "i" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>w", true, true, true), "n", true)
    else
        vim.cmd("normal! w")
    end

    vim.schedule(function()
        local new_row = vim.api.nvim_win_get_cursor(0)[1]
        if new_row ~= original_row then
            local line = vim.api.nvim_buf_get_lines(0, original_row - 1, original_row, false)[1]
            vim.api.nvim_win_set_cursor(0, { original_row, #line })
        end
    end)
end

local function prev_word_no_wrap()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local original_row = row
    local mode = vim.api.nvim_get_mode().mode

    if mode == "i" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>b", true, true, true), "n", true)
    else
        vim.cmd("normal! b")
    end

    vim.schedule(function()
        local new_row = vim.api.nvim_win_get_cursor(0)[1]
        if new_row ~= original_row then
            vim.api.nvim_win_set_cursor(0, { original_row, 0 })
        end
    end)
end

wk.add({
    { "<C-Right>", next_word_no_wrap, mode = { "n", "i", "v" }, desc = "Next word no wrap" },
    { "<C-Left>", prev_word_no_wrap, mode = { "n", "i", "v" }, desc = "Prev word no wrap" },
})

local function move_up_10()
    vim.cmd("normal! 10k")
end

local function move_down_10()
    vim.cmd("normal! 10j")
end

wk.add({
    { "<C-Up>", move_up_10, mode = { "n", "v" }, desc = "Move up 10" },
    { "<C-Down>", move_down_10, mode = { "n", "v" }, desc = "Move down 10" },
})

vim.api.nvim_set_keymap("", "<S-Left>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-Right>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-Up>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-Down>", "<Nop>", { noremap = true, silent = true })
