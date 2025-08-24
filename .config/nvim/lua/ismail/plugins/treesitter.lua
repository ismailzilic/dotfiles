return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				ensure_installed = {
					"vimdoc",
					"vim",
					"gitignore",
					"dockerfile",
					"json",
					"javascript",
					"typescript",
					"tsx",
					"jsx",
					"yaml",
					"html",
					"css",
					"markdown",
					"markdown_inline",
					"lua",
					"c",
					"cpp",
					"c_sharp",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
					},
				},
				additional_vim_regex_highlighting = false,
			})
		end,
	},
	-- JS, TS, JSX, TSX Auto Close Tags
	{
		"windwp/nvim-ts-autotag",
		enabled = true,
		ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
		config = function()
			-- Independent nvim-ts-autotag setup
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto-close tags
					enable_rename = true, -- Auto-rename pairs
					enable_close_on_slash = false, -- Disable auto-close on trailing `</`
				},
				per_filetype = {
					["html"] = {
						enable_close = true, -- Disable auto-closing for HTML
					},
					["typescriptreact"] = {
						enable_close = true, -- Explicitly enable auto-closing (optional, defaults to `true`)
					},
				},
			})
		end,
	},
}
