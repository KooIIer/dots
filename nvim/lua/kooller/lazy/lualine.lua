return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = { "alpha", "dashboard" },
                    winbar = { "alpha", "dashboard" },
                },
            },
            sections = {
                lualine_x = {
                    "encoding",
                    { "fileformat", symbols = { unix = " " } },
                    "filetype",
                },
            },
        })
    end,
}
