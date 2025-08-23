return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
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
				"clangd",
			},
		})
	end,
}
