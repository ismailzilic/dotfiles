return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			"<leader>lf",
			function() require("conform").format({ async = true, lsp_fallback = true }) end,
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			java = { "google-java-format" },
			kotlin = { "ktlint" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			python = { "black" },
		},
	},
}
