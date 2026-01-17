return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/lazydev.nvim", opts = {} },
    },
    config = function()
        -- local nvim_lsp = require("lspconfig")
    	
		require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")

        local on_attach = function(client, bufnr)
            -- format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end
        end

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
		})
		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					typeCheckingMode = "standard",
				}
			},
		})

		vim.lsp.enable({
			'basedpyright', 'cssls', 'html',
			'jsonls', 'eslint', 'biome'
		})
    end,
}
