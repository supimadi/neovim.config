return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
		"EmranMR/tree-sitter-blade",
    },
    config = function()
		-- Blade config
        vim.filetype.add({
            pattern = {
                [".*%.blade%.php"] = "blade",
            },
        })
        vim.treesitter.language.register("blade", "blade")

        local treesitter = require("nvim-treesitter.config")
        treesitter.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            autotag = {
                enable = true,
            },
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "c",
                "rust",
                "php",
                "php_only",
                "blade",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            rainbow = {
                enable = true,
                disable = { "html" },
                extended_mode = false,
                max_file_lines = nil,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "blade", "html", "php" },
            callback = function(args)
                vim.treesitter.start(args.buf)
            end,
        })
    end,
}
