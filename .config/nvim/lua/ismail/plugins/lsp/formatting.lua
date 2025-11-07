return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        yaml = { "yamlfmt", "prettier" },
        markdown = { "markdownlint", "prettier" },

        -- Web apps
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },

        -- MS ahh stack
        cs = { "csharpier" },
        razor = { "csharpier" },
        cshtml = { "csharpier" },

        -- C / C++
        c = { "clang-format" },
        cpp = { "clang-format" },
        h = { "clang-format" },
        hpp = { "clang-format" },
        objc = { "clang-format" },
      },

      formatters = {
        stylua = {
          prepend_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
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
          require_config = true,
          args = {
            "--stdin-filepath",
            "$FILENAME",
            "--tab-width",
            "2",
            "--use-tabs",
            "false",
          },
        },

        csharpier = {
          command = "dotnet",
          args = { "csharpier", "--write-stdout" },
        },

        clang_format = {
          args = { "--style={ BasedOnStyle: LLVM, IndentWidth: 4 }" },
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
