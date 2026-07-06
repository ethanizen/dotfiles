return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		defaults = {
			preview = { treesitter = false },
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Recent files" },
		{ "<leader>fF", function()
			require("telescope.builtin").find_files({ search_dirs = { vim.fn.expand("~") } })
		end, desc = "Find files (home)" },
		{ "<leader>fG", function()
			require("telescope.builtin").live_grep({ search_dirs = { vim.fn.expand("~") } })
		end, desc = "Live grep (home)" },
	}
}
