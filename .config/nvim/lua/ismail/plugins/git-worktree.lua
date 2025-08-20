return {
	"ThePrimeagen/git-worktree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		local gitworktree = require("git-worktree")

		gitworktree.setup()

		require("telescope").load_extension("git_worktree")

		-- Defaults
		-- <Enter> - switches to that worktree
		-- <C-d> - deletes that worktree
		-- <C-f> - toggles forcing of the next deletion

		-- Switch/list worktrees
		vim.keymap.set("n", "<leader>wl", function()
			require("telescope").extensions.git_worktree.git_worktrees()
		end, { desc = "List Git Worktree" })

		-- Create new worktree
		vim.keymap.set("n", "<leader>wc", function()
			require("telescope").extensions.git_worktree.create_git_worktree()
		end, { desc = "Create Git Worktree Branches" })
	end,
}
