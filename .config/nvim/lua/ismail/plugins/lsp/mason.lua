return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "Saghen/blink.cmp",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- LSPs to install
    mason_lspconfig.setup({
      automatic_enable = false,
      ensure_installed = {
        "vimls",
        "bashls",
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "marksman",
        "angularls",
        "csharp_ls",
        "yamlls",
      },
    })

    -- Formatters to install
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "clang-format",
        "csharpier",
        "markdownlint",
        "yamlfmt",
      },
    })
  end,
}
