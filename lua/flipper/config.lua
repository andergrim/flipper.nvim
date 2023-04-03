local Flipper = {}

--- Registers the plugin mappings if the option is enabled.
---
---@param options table The mappins provided by the user.
---@param mappings table A key value map of the mapping name and its command.
---
---@private
local function registerMappings(options, mappings)
    -- all of the mappings are disabled
    if not options.enabled then
        return
    end

    for name, command in pairs(mappings) do
        -- this specific mapping is disabled
        if not options[name] then
            return
        end

        assert(type(options[name]) == "string", string.format("`%s` must be a string", name))
        vim.api.nvim_set_keymap("n", options[name], command, { silent = true })
    end
end

--- Flipper configuration with its default values.
---
---@type table
---Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
Flipper.options = {
    --- @type boolean 
    debug = false,
    -- Defines the word pairs to flip between
    ---@type table
    flippers = {
        {"true",    "false"},
        {"True",    "False"},
        {"yes",     "no"},
        {"on",      "off"},
        {"enabled", "disabled"},
        {"enable",  "disable"},
    },
    -- Keyboard mappings.
    --- @type table
    mappings = {
        -- When `true`, creates all the mappings that are not set to `false`.
        --- @type boolean
        enabled = false,
        -- Sets a global mapping to Neovim which allows you to toggle the
        -- word under the cursor
        -- When `false`, the mapping is not created.
        --- @type string
        flipword = "<Leader>i",
    },
}

--- Define your flipper setup.
---
---@param options table Module config table. See |Flipper.options|.
---
---@usage `require("flipper").setup()` (add `{}` with your |Flipper.options| table)
function Flipper.setup(options)
    options = options or {}

    Flipper.options = vim.tbl_deep_extend("keep", options, Flipper.options)

    registerMappings(Flipper.options.mappings, {
        flipword = ":Flipper<CR>",
    })

    return Flipper.options
end

return Flipper
