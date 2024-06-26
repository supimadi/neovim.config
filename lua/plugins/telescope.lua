return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 
		{ 'nvim-lua/plenary.nvim' },
		{ 
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
    	},
	},
    config = function()
    local telescope = require("telescope")
	local builtin = require('telescope.builtin')

	telescope.load_extension("live_grep_args")

	-- Set keymaps
	vim.keymap.set('n', '<space><space>', builtin.find_files, {})
	vim.keymap.set('n', '<space>wb', builtin.buffers, {})
	vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    end,
}
