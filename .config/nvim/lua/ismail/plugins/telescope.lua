return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
			},
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			pickers = {
				oldfiles = { prompt_title = "Recent files" },
				colorscheme = {
					enable_preview = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
		vim.keymap.set(
			"n",
			"<leader>th",
			"<cmd>Telescope colorscheme<CR>",
			{ noremap = true, silent = true, desc = "Telescope theme switcher" }
		)
	end,
}
