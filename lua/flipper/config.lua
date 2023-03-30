local Flipper = {}

--- Your plugin configuration with its default values.
---
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
Flipper.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
}

--- Define your flipper setup.
---
---@param options table Module config table. See |Flipper.options|.
---
---@usage `require("flipper").setup()` (add `{}` with your |Flipper.options| table)
function Flipper.setup(options)
    options = options or {}

    Flipper.options = vim.tbl_deep_extend("keep", options, Flipper.options)

    return Flipper.options
end

return Flipper
