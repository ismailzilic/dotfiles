return {
	"mfussenegger/nvim-lint",
	event = "BufWritePost",
	keys = {
		{
			"<leader>ll",
			function() require("lint").try_lint() end,
			desc = "Lint buffer",
		},
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			java = { "checkstyle" },
			kotlin = { "ktlint" },
			rust = { "clippy" },
			python = { "ruff" },
			c = { "cppcheck" },
			cpp = { "cppcheck" },
			lua = { "selene" },
			typescript = { "eslint_d" },
			javascript = { "eslint_d" },
			bash = { "shellcheck" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function() lint.try_lint() end,
		})
	end,
}
