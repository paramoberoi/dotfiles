return {
-- 	"catppuccin/nvim",
-- 	lazy = false,
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("catppuccin")
-- 		vim.cmd([[highlight Normal guibg=#000000]])
-- 		vim.cmd([[highlight NonText guibg=#000000]])
-- 	end,
-- }
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd[[colorscheme tokyonight-night]]
  end,
}
