return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            enabled = true,
            events = {"InsertLeave"}, -- vim events that trigger save
            condition = function(buf)
                -- Check if buffer is valid before accessing it
                if not vim.api.nvim_buf_is_valid(buf) then
                    return false
                end
                
                local filetype = vim.bo[buf].filetype
                -- Don't auto-save oil.nvim, quickfix buffers, or Neogit commit messages
                if filetype == "oil" or filetype == "qf" or filetype == "NeogitCommitMessage" then
                    return false
                end
                return true
            end,
        })
    end,
}
