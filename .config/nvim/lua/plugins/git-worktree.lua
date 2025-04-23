return {
	"ThePrimeagen/git-worktree.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {},
	config = function()
		require("git-worktree").setup()
		-- require("telescope").load_extension("git-worktree")
		vim.keymap.set("n", "<leader>sG", function()
			require("telescope").extensions.git_worktree.git_worktrees()
		end, { desc = "search through [G]it worktrees" })
	end,
}
