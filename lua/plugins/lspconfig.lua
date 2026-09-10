return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/lazydev.nvim", opts = {} },
    },
    config = function()
		require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")

        local capabilities = require("blink.cmp").get_lsp_capabilities()

		mason_lspconfig.setup {
			ensure_installed = {"basedpyright", "html", "eslint", "biome"},
			automatic_enable = true,
		}

		vim.diagnostic.config({
			virtual_lines = {
				current_line = true,
			},
		})

		vim.lsp.config('*', {
			capabilities = capabilities,
			root_markers = { '.git' },
		})
		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					typeCheckingMode = "standard",
				}
			},
		})
		vim.lsp.config("biome", {
			capabilities = capabilities,
			filetypes = {
			  'astro',
			  'css',
			  'graphql',
			  'javascript',
			  'javascriptreact',
			  'json',
			  'jsonc',
			  'svelte',
			  'typescript',
			  'typescript.tsx',
			  'typescriptreact',
			  'vue',
			},
		})

		vim.lsp.enable({
			'basedpyright', 'cssls', 'html',
			'jsonls', 'eslint', 'biome',
		})
    end,
}
