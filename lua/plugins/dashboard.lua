return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
		theme = 'doom',
		config = {
			header = vim.split(vim.g.dashboard_custom_header, "\n"),
			center = { { action = "", desc = "", icon = " " } },
			footer = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return {
					"Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
				}
			end,
		},
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
