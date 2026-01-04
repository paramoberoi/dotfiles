return {
    {
        "igorlfs/nvim-dap-view",
        lazy = false,
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dap-view").setup({
                auto_toggle = true,
                winbar = {
                    controls = {
                        enabled = true,
                    },
                },
            })
        end,
    },
}
