return {
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts

	opts = {
			keymaps = {
					["<C-s>"] = false,
					["<C-p>"] = {
							callback = function()
									local oil = require("oil")
									local util = require("oil.util")
									local winid = util.get_preview_win()
									if winid then
											vim.api.nvim_win_close(winid, true)
									else
											oil.open_preview({
													vertical = true,
													split = "botright",
											})
									end
							end,
					},
			},
	},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
}
