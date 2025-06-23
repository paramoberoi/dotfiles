local path_utils = require("utils.path")

vim.api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
    callback = function()
        local root = path_utils.find_root()
        if root then
            vim.g.augment_workspace_folders = { root }
        end
    end,
})
