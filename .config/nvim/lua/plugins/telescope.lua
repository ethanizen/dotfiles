return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	-- config = function()
	-- 	local builtin = require('telescope.builtin')
	-- 	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })	
	-- end,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc="Telescope" },
		{ "<leader>fs", function()
					local builtin = require("telescope.builtin")
					builtin.grep_string({ search = vim.fn.input("Grep > ") })
				end, desc="Telescope Grep"
		}
	}
}
