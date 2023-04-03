local D = require("flipper.util.debug")

-- internal methods
local Flipper = {}

---@private
function Flipper.flip()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local char = vim.api.nvim_get_current_line():sub(col+1,col+1)

    -- Don't proceed if we're on a whitespace
    if string.match(char, "%s") then
        return
    end

    local current_word = vim.fn.expand('<cword>')

    for i = 1, #_G.Flipper.config.flippers do
        local word_first, word_second = unpack(_G.Flipper.config.flippers[i])
        if word_first == current_word then
            vim.cmd("normal! ciw" .. word_second)
            vim.cmd("normal! b")
            break
        elseif word_second == current_word then
            vim.cmd("normal! ciw" .. word_first)
            vim.cmd("normal! b")
            break
        end
    end
end

return Flipper
