-- Find the project root directory
local M = {}

M.find_root = function()
    -- Try to find git root first
    local git_root = vim.fn.system('git rev-parse --show-toplevel 2> /dev/null')
    git_root = git_root:gsub("%s+", "") -- Remove whitespace

    if vim.v.shell_error == 0 then
        -- print("Found git root: " .. git_root)
        return git_root
    end

    -- If no git root found, return the current file's directory
    local current_file = vim.fn.expand("%:p")
    local current_dir = vim.fn.fnamemodify(current_file, ":h")
    -- print("Found current directory: " .. current_dir)
    return current_dir
end

return M
