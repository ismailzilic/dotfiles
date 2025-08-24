return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "williamboman/mason-lspconfig.nvim" },
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
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Vimscript
		lspconfig.vimls.setup({})

		-- Lua
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- HTML
		lspconfig.html.setup({})

		-- CSS
		lspconfig.cssls.setup({})

		-- Typescript
		lspconfig.tsserver.setup({
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git"),
		})

		-- Angular
		lspconfig.angularls.setup({
			cmd = {
				vim.fn.stdpath("data") .. "/mason/bin/angular-language-server",
				"--ngProbeLocations",
				vim.fn.stdpath("data") .. "/mason/packages/angular-language-server/node_modules",
				"--tsProbeLocations",
				vim.fn.stdpath("data") .. "/mason/packages/angular-language-server/node_modules",
				"--stdio",
			},
			capabilities = capabilities,
			filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
			root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
		})

		-- C#
		lspconfig.omnisharp.setup({
			cmd = { vim.fn.stdpath("data") .. "mason/bin/omnisharp" },
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				if client.server_capabilities.semanticTokensProvider then
					local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
					vim.api.nvim_create_autocmd("TextChanged", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.semantic_tokends_full()
						end,
					})
					vim.api.nvim_create_autocmd("TextChangedI", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.semantic_tokends_full()
						end,
					})
				end
			end,
		})

		-- C / C++
		lspconfig.clangd.setup({
			lspconfig.clangd.setup({
				capabilities = capabilities,
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd" },
			}),
		})

		-- Yaml
		lspconfig.yamlls.setup({})
	end,
}
