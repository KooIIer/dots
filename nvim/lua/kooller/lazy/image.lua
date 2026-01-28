return {
    "3rd/image.nvim",
    lazy = false,
    build = false,
    opts = {
        backend = "kitty",
        processor = "magick_cli",
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "markdown", "vimwiki", "quarto" },
            },
            neorg = {
                enabled = true,
                filetypes = { "norg" },
            },
        },
        max_width_window_percentage = 100,
        max_height_window_percentage = 100,
        hijack_file_patterns = { 
            "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" 
        },
    },
    config = function(_, opts)
        require("image").setup(opts)
    end,
}
