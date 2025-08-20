return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        --priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "frappe", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "frappe",
                    dark = "frappe",
                },
                transparent_background = true,
                float = {
                    transparent = true, -- enable transparent floating windows
                    solid = false, -- use solid styling for floating windows, see |winborder|
                },
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = false,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                no_italic = false, -- Force no italic
                no_bold = true, -- Force no bold
                no_underline = false, -- Force no underline
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                },
                default_integrations = true,
                auto_integrations = false,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                },
                enable = {
                    terminal = false,
                    legacy_highlights = false,
                    migrations = true,
                },
            })
            vim.cmd("colorscheme catppuccin")
        end,
    }
}
