return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		-- get access to the none-ls functions
		local null_ls = require("null-ls")
		-- run the setup function for none-ls to setup our different formatters
		null_ls.setup({
			sources = {
				-- setup lua formatter
				null_ls.builtins.formatting.stylua,
				-- setup eslint linter for javascript
				require("none-ls.diagnostics.eslint_d"),
				-- setup prettier to format languages that are not lua
				null_ls.builtins.formatting.prettierd.with({
					extra_args = function(params)
						return params.options
							and params.options.tabSize
							and {
								"--tab-width",
								params.options.tabSize,
							}
					end,
				}),
			},
		})

	end,
}
