return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                  -`",
            "                 .o+`",
            "                `ooo/",
            "               `+oooo:",
            "              `+oooooo:",
            "              -+oooooo+:",
            "            `/:-:++oooo+:",
            "           `/++++/+++++++:",
            "          `/++++++++++++++:",
            "         `/+++ooooooooooooo/`",
            "        ./ooosssso++osssssso+`",
            "       .oossssso-````/ossssss+`",
            "      -osssssso.      :ssssssso.",
            "     :osssssss/        osssso+++.",
            "    /ossssssss/        +ssssooo/-",
            "  `/ossssso+/:-        -:/+osssso+-",
            " `+sso+:-`                 `.-/+oso:",
            "`++:.                           `-/+/",
            ".`                                 `/",
        }

        dashboard.section.header.opts.hl = "Keyword"
        dashboard.section.buttons.val = {
        dashboard.button("e", "  new", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "󰍉  find", ":Telescope find_files<CR>"),
        dashboard.button("r", "  recent", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "  quit", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)
    end,
}
