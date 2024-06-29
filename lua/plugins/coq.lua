return {
  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    -- main one
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc
  },
  init = function()
    vim.g.coq_settings = {
        auto_start = true, -- if you want to start COQ at startup
        -- Your COQ settings here
    }
  end,
  config = function()
    -- Your LSP settings here
    local lsp = require "lspconfig"
    local coq = require "coq"

    -- python language
	lsp.pyright.setup(coq.lsp_ensure_capabilities())
	-- lsp.jinja_lsp.setup{}
	-- lsp.jedi_language_server.setup(coq.lsp_ensure_capabilities())
	-- local venv_path = os.getenv('VIRTUAL_ENV')
 --  	local py_path = nil
	--  -- decide which python executable to use for mypy
	--  if venv_path ~= nil then
	--    py_path = venv_path .. "/bin/python3"
	--  else
	--    py_path = vim.g.python3_host_prog
	--  end
	--  
	-- lsp.pylsp.setup(coq.lsp_ensure_capabilities({
	-- 	on_attach = custom_attach,
	-- 	settings = {
	-- 		pylsp = {
	-- 			plugins = {
	-- 			-- formatter options
	-- 			black = { enabled = true },
	-- 			autopep8 = { enabled = false },
	-- 			yapf = { enabled = false },
	-- 			-- linter options
	-- 			pylint = { enabled = true, executable = "pylint" },
	-- 			ruff = { enabled = false },
	-- 			pyflakes = { enabled = false },
	-- 			pycodestyle = { enabled = false },
	-- 			-- type checker
	-- 			pylsp_mypy = {
	-- 				enabled = true,
	-- 				overrides = { "--python-executable", py_path, true },
	-- 				report_progress = true,
	-- 				live_mode = false,
	-- 			},
	-- 			-- auto-completion options
	-- 			jedi_completion = { fuzzy = true },
	-- 			-- import sorting
	-- 			isort = { enabled = true },
	-- 		},
	-- 	},
	-- 	flags = {
	-- 		debounce_text_changes = 200,
	-- 	},
	-- 	capabilities = capabilities,
	-- 	}
	-- }))

	-- emmet or html
	lsp.emmet_language_server.setup(coq.lsp_ensure_capabilities({
		filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "htmldjango" },
		-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
		-- **Note:** only the options listed in the table are supported.
		init_options = {
			---@type table<string, string>
			includeLanguages = { "htmldjango" },
			--- @type string[]
			excludeLanguages = {},
			--- @type string[]
			extensionsPath = {},
			--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
			preferences = {},
			--- @type boolean Defaults to `true`
			showAbbreviationSuggestions = true,
			--- @type "always" | "never" Defaults to `"always"`
			showExpandedAbbreviation = "always",
			--- @type boolean Defaults to `false`
			showSuggestionsAsSnippets = false,
			--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
			syntaxProfiles = {},
			--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
			variables = {},
	  	},
	}))
  end,
}
