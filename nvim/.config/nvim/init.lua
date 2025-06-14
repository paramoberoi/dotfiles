-- Set JAVA_HOME for jdtls
-- vim.uv.os_setenv("JAVA_HOME", "/opt/homebrew/opt/openjdk@22")

-- Declare the path where lazy will clone plugin code
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local opts = {
	-- change_detection = {
	-- 	-- Don't notify us every time a change is made to the configuration
	-- 	notify = false,
	-- },
	checker = {
		-- Automatically check for package updates
		enabled = true,
		-- Don't spam us with notification every time there is an update available
		notify = false,
	},
}

-- Check to see if lazy itself has been cloned, if not clone it into the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
-- Add the path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

-- Load the options
require("config/vim-options")
-- Load the keymaps
require("config/keymaps")
-- Load the autocommands
require("config/autocommands")

require("lazy").setup("plugins", opts)
