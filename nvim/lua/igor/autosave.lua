-- autosave.lua

local M = {}

-- Define the autocommand to autosave on focus lost, buffer switch, etc.
function M.setup()
    vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "WinLeave"}, {
        pattern = "*",
        callback = function()
            if vim.bo.modified then
                vim.cmd("silent! write")
            end
        end
    })
end

return M

