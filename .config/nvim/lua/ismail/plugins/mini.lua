return {
    {
        "echasnovski/mini.comment",
        version = false,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require("ts_context_commentstring").setup {
                enable_autocmd = false
            }
            require("mini.comment").setup {
                -- html, jsx, tsx, svelte comment support
                options = {
                    custom_commentstring = function()
                        return require("ts_context_commentstring.internal").calculate_commentstring({ key = "commentstring" })
                        or vim.bo.commentstring
                    end,
                },
            }
        end
    },
    {
        "echasnovski/mini.surround",
        opts = {
            custom_surroundings = nil,

            highlight_duration = 500,

            mappings = {
            add = 'sa', -- Add surrounding in Normal and Visual modes
            delete = 'sd', -- Delete surrounding
            find = 'sf', -- Find surrounding (to the right)
            find_left = 'sF', -- Find surrounding (to the left)
            highlight = 'sh', -- Highlight surrounding
            replace = 'sr', -- Replace surrounding
            update_n_lines = 'sn', -- Update `n_lines`

            suffix_last = 'l', -- Suffix to search with "prev" method
            suffix_next = 'n', -- Suffix to search with "next" method
            },

            -- Number of lines within which surrounding is searched
            n_lines = 20,

            respect_selection_type = false,
            search_method = 'cover',
            silent = false,
        },
    },
    {
        "echasnovski/mini.trailspace",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local miniTrailspace = require("mini.trailspace")

            miniTrailspace.setup({
                only_in_normal_mode = true,
            })

            vim.keymap.set("n", "<leader>cw", function() miniTrailspace.trim() end, { desc = "Remove whitespace" })
        end
    },
    {
        "echasnovski/mini.splitjoin",
        config = function()
            local miniSplitJoin = require("mini.splitjoin")

            miniSplitJoin.setup({
                mappings = { toggle = "" }
            })

            vim.keymap.set({ "n", "x" }, "sj", function() miniSplitJoin.join() end, { desc = "Join arguments" })
            vim.keymap.set({ "n", "x" }, "sk", function() miniSplitJoin.split() end, { desc = "Split arguments" })
        end,
    },
}
