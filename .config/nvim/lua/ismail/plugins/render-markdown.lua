return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  config = function()
    local render_mkdown = require("render-markdown")

    render_mkdown.setup({
      completions = { blink = { enabled = true } },
    })

    vim.keymap.set(
      "n",
      "<leader>mk",
      function() render_mkdown.toggle() end,
      { desc = "Toggle render markdown" }
    )
  end,
}
