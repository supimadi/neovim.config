return {
  -- the colorscheme should be available when starting Neovim
  {
    "gbprod/nord.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("nord").setup({})
      vim.cmd.colorscheme("nord")
      vim.cmd([[syntax on]])
      vim.cmd([[set background=dark]])
    end,
    install = {
        colorscheme = { "nord" },
     },
  },
}
