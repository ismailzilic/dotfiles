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

    vim.keymap.set(
      "n",
      "<leader>ha",
      function() harpoon:list():add() end,
      { desc = "Harpoon add file" }
    )
    vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<A-j>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<A-k>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<A-l>", function() harpoon:list():select(4) end)

    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
  end,
}
