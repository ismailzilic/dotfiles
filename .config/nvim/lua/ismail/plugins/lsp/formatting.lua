return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                yaml = { "yamlfmt", "prettier" },
                markdown = { "markdownlint", "prettier" },

                -- Web apps
                javascript = { "biome-check" },
                typescript = { "biome-check" },
                javascriptreact = { "biome-check" },
                typescriptreact = { "biome-check" },
                css = { "biome-check" },
                json = { "prettier" },
                scss = { "biome-check" },
                cs = { "csharpier" },

                -- C / C++
                c = { "clang-format" },
                cpp = { "clang-format" },
                h = { "clang-format" },
                hpp = { "clang-format" },
            },

            formatters = {
                stylua = {
                    prepend_args = {
                        "--indent-type",
                        "Spaces",
                        "--indent-width",
                        "4",
                        "--column-width",
                        "100",
                        "--quote-style",
                        "AutoPreferDouble",
                        "--call-parentheses",
                        "Always",
                        "--collapse-simple-statement",
                        "Always",
                        "--sort-requires",
                    },
                },

                prettier = {
                    args = {
                        "--stdin-filepath",
                        "$FILENAME",
                        "--tab-width",
                        "4",
                        "--use-tabs",
                        "false",
                    },
                },
            },
        })

        vim.keymap.set(
            "n",
            "<leader>f",
            function() require("conform").format({ async = true, lsp_fallback = true }) end,
            { desc = "Format file" }
        )
    end,
}
