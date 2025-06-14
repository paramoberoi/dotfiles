return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            enabled = true,
            events = {"InsertLeave"}, -- vim events that trigger save
        })
    end,
}
