return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- LSP Keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- Show LSP references

				vim.keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<CR>", opts) -- Show LSP definitions

				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Show LSP implementations

				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- Show LSP type definitions

				vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts) -- Go to declaration

				vim.keymap.set({ "n", "v" }, "<leader>ca", function() -- See available code actions
					vim.lsp.buf.code_action()
				end, opts)

				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename all references under cursor

				vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- Show buffer diagnostics

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation for what is under cursor

				vim.keymap.set("n", "<leader>rs", ":Lspsestart<CR>", opts) -- Restart LSP

				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end,
		})

		-- Diagnostic signs
		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		}

		vim.diagnostic.config({
			signs = {
				text = signs,
			},
			virtual_text = true,
			underline = true,
			update_in_insert = false,
		})

		-- SERVER SETUPS
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Vimscript
		lspconfig.vimls.setup({
			capabilities = capabilities,
		})

		-- Lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- HTML
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- CSS
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		-- Typescript
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			single_file_support = false,
			init_options = {
				preferences = {
					includeCompletionsWithSnippetText = true,
					includeCompletionsForImportStatements = true,
				},
			},
		})

		-- Angular
		lspconfig.angularls.setup({
			capabilities = capabilities,
		})

		-- C#
		lspconfig.csharp_ls.setup({
			capabilities = capabilities,
		})

		-- C / C++
		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		-- Yaml
		lspconfig.yamlls.setup({
			capabilities = capabilities,
		})
	end,
}
