return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = { 
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-live-grep-args.nvim' },
	},
    config = function()
		local telescope = require("telescope")
		local builtin = require('telescope.builtin')

		-- telescope.load_extension("live_grep_args")

		-- Set keymaps
		vim.keymap.set('n', '<space><space>', builtin.find_files, {})
		vim.keymap.set('n', '<space>wb', builtin.buffers, {})
		vim.keymap.set("n", "<space>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

		telescope.setup({
			defaults = {
				preview = { treesitter = false },
				layout_strategy='vertical',
				layout_config = { 
					width = 0.9,
					height = 0.95,
					preview_height = 0.7,
				}
			},
		})
		-- telescope.setup({
		-- 	pickers = {
		-- 		find_files = {
		-- 			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
		-- 			find_command = { "rg", "--files", "--glob", "!**/venv/*" },
		-- 		},
		-- 	},
		-- })
    end,
}
