return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			debounce = 100,
			whitespace = { highlight = { "Whitespace", "NonText" } },
			exclude = {
				filetypes = {
					'lspinfo',
					'packer',
					'checkhealth',
					'help',
					'man',
					'dashboard',
					'lua',
					'',
				}
			}
		})
	end,
	opts = {} 
}
