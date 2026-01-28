return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            color_overrides = {
                mocha = {
                    base = "#11111b",
                    mauve = "#cba6f7",
                    lavender = "#b4befe",
                    blue = "#89b4fa",
                },
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                treesitter = true,
                mason = true,
                fidget = true,
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
