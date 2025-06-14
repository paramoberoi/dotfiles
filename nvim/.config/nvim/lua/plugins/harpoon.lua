return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()
    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>he", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- vim.keymap.set("n", "<C-h>", function()
    --   harpoon:list():select(1)
    -- end)
    -- vim.keymap.set("n", "<C-j>", function()
    --   harpoon:list():select(2)
    -- end)
    -- vim.keymap.set("n", "<C-k>", function()
    --   harpoon:list():select(3)
    -- end)
    -- vim.keymap.set('n', '<C-4>', function()
    --   print("4")
    -- end)
    -- vim.keymap.set("n", "<C-s>", function()
    --   harpoon:list():select(4)
    -- end)

    -- Toggle previous & next buffers stored within Harpoon list
    -- Below does not work. Figure out why
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end)
  end,
}
