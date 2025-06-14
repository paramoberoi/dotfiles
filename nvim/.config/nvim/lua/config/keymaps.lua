vim.g.mapleader = " "
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("n", "<Leader>p", '"+p')

-- vim.keymap.set('n', '<leader>[', '<C-T>')
-- vim.keymap.set('n', '<leader>]', '<C-]>')

-- vim.keymap.set('i', '<C-]>', '<Plug>(copilot-accept-word)')

-- Save file
vim.keymap.set({ "n", "i" }, "<C-s>", "<ESC>:w<CR>")

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Augment keymaps
vim.keymap.set("n", "<leader>ac", ":Augment chat<CR>", { desc = "[A]ugment [C]hat" })
vim.keymap.set("v", "<leader>ac", ":Augment chat<CR>", { desc = "[A]ugment [C]hat" })
vim.keymap.set("n", "<leader>an", ":Augment chat-new<CR>", { desc = "[A]ugment [N]ew-chat" })
vim.keymap.set("n", "<leader>at", ":Augment chat-toggle<CR>", { desc = "[A]ugment [T]oggle" })

vim.keymap.set("n", "<leader>dg", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- Format json using jq
vim.keymap.set("n", "<leader>jq", ":%!jq<CR>", { desc = "Format JSON using jq" })
vim.keymap.set("v", "<leader>jq", ":!jq<CR>", { desc = "Format JSON using jq" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- JDTLS
-- Set a Vim motion to <Space> + <Shift>J + o to organize imports in normal mode
vim.keymap.set(
    "n",
    "<leader>jo",
    "<Cmd> lua require('jdtls').organize_imports()<CR>",
    { desc = "[J]ava [O]rganize Imports" }
)
-- Set a Vim motion to <Space> + <Shift>J + v to extract the code under the cursor to a variable
vim.keymap.set(
    "n",
    "<leader>jv",
    "<Cmd> lua require('jdtls').extract_variable()<CR>",
    { desc = "[J]ava Extract [V]ariable" }
)
-- Set a Vim motion to <Space> + <Shift>J + v to extract the code selected in visual mode to a variable
vim.keymap.set(
    "v",
    "<leader>jv",
    "<Esc><Cmd> lua require('jdtls').extract_variable(true)<CR>",
    { desc = "[J]ava Extract [V]ariable" }
)
-- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code under the cursor to a static variable
vim.keymap.set(
    "n",
    "<leader>jC",
    "<Cmd> lua require('jdtls').extract_constant()<CR>",
    { desc = "[J]ava Extract [C]onstant" }
)
-- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code selected in visual mode to a static variable
vim.keymap.set(
    "v",
    "<leader>jC",
    "<Esc><Cmd> lua require('jdtls').extract_constant(true)<CR>",
    { desc = "[J]ava Extract [C]onstant" }
)
-- Set a Vim motion to <Space> + <Shift>J + t to run the test method currently under the cursor
vim.keymap.set(
    "n",
    "<leader>jt",
    "<Cmd> lua require('jdtls').test_nearest_method()<CR>",
    { desc = "[J]ava [T]est Method" }
)
-- Set a Vim motion to <Space> + <Shift>J + t to run the test method that is currently selected in visual mode
vim.keymap.set(
    "v",
    "<leader>jt",
    "<Esc><Cmd> lua require('jdtls').test_nearest_method(true)<CR>",
    { desc = "[J]ava [T]est Method" }
)
-- Set a Vim motion to <Space> + <Shift>J + <Shift>T to run an entire test suite (class)
vim.keymap.set("n", "<leader>jT", "<Cmd> lua require('jdtls').test_class()<CR>", { desc = "[J]ava [T]est Class" })
-- Set a Vim motion to <Space> + <Shift>J + u to update the project configuration
vim.keymap.set("n", "<leader>ju", "<Cmd> JdtUpdateConfig<CR>", { desc = "[J]ava [U]pdate Config" })

-- Toggle virtual text
vim.api.nvim_create_user_command("ToggleVirtualText", function()
    local current_setting = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not current_setting })
end, {})

-- Toggle virtual text
vim.api.nvim_set_keymap("n", "<Leader>vt", ":ToggleVirtualText<CR>", { noremap = true, silent = true , desc = "Toggle virtual text" })

-- Neogit 
vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Neogit Status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Neogit Commit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Neogit pull<CR>", { desc = "Neogit Pull" })
vim.keymap.set("n", "<leader>gP", "<cmd>Neogit push<CR>", { desc = "Neogit Push" })
vim.keymap.set("n", "<leader>gh", "<cmd>Neogit help<CR>", { desc = "Neogit Help" })
vim.keymap.set("n", "<leader>gd", "<cmd>Neogit diff<CR>", { desc = "Neogit Diff" })
vim.keymap.set("n", "<leader>gf", "<cmd>Neogit fetch<CR>", { desc = "Neogit Fetch" })
