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
		local require = require('blink.lib.lazy_require')

		mason_lspconfig.setup {
    		ensure_installed = { "basedpyright", "html", "eslint", "biome", "intelephense", "emmet_ls" },
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
			  'php',
			  'blade',
			  'typescript.tsx',
			  'typescriptreact',
			  'vue',
			},
		})
		vim.lsp.config("html", {
			capabilities = capabilities,
			filetypes = { "html", "php", "blade" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true
				},
				provideFormatter = true
			}
		})
		vim.filetype.add({
			extension = {
				blade = "blade",
			},
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		})
		vim.lsp.config("intelephense", {
			environment = {
				phpVersion = "8.5.9",
			},
		})

		vim.lsp.enable({
			'basedpyright', 'cssls', 'html',
			'jsonls', 'eslint', 'biome', "intelephense",
		})
    end,
}
