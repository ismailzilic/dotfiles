return {
    "thePrimeagen/harpoon",
    enabled = true,
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            global_settings = {
                save_on_toggle = true,
                save_on_change = true,
            },
        })

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file" })
        vim.keymap.set("n", "<leader>hl", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<A-H>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<A-J>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<A-K>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<A-L>", function() harpoon:list():select(4) end)

        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
    end
}
