return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    config = function()
        require("telescope").setup({
            defaults = {
                path_display = { "smart" },
            },
            pickers = {
                find_files = {
                    theme = "ivy",
                },
                live_grep = {
                    theme = "ivy",
                },
                oldfiles = {
                    theme = "ivy",
                },
            },
            extensions = {
                fzf = {},
            },
        })
        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>fe", builtin.oldfiles, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fn", function()
            builtin.find_files({
                cwd = vim.fn.stdpath("config"),
            })
        end, {})
        local path_utils = require("utils.path")
        vim.keymap.set("n", "<leader>ff", function()
            local root = path_utils.find_root()
            if root then
                print("root: " .. root)
                builtin.find_files({ cwd = root })
            end
        end)
        vim.keymap.set(
            "n",
            "<leader>cr",
            require("telescope.builtin").lsp_references,
            { desc = "[C]ode Goto [R]eferences" }
        )
        -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
        vim.keymap.set(
            "n",
            "<leader>ci",
            require("telescope.builtin").lsp_implementations,
            { desc = "[C]ode Goto [I]mplementations" }
        )
        require("utils.multigrep").setup()
    end,
}
