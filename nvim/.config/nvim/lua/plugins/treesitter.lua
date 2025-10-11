return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {enable = true},
    })
    local hocon_group = vim.api.nvim_create_augroup("hocon", { clear = true })
    vim.api.nvim_create_autocmd(
      { "BufNewFile", "BufRead" },
      { group = hocon_group, pattern = "*.conf", command = "set ft=hocon" }
    )
    
    local jsonl_group = vim.api.nvim_create_augroup("jsonl", { clear = true })
    vim.api.nvim_create_autocmd(
      { "BufNewFile", "BufRead" },
      { group = jsonl_group, pattern = "*.jsonl", command = "set ft=json" }
    )
  end,
}
