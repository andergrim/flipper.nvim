local M = require("flipper.main")
local Flipper = {}

-- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function Flipper.toggle()
    -- when the config is not set to the global object, we set it
    if _G.Flipper.config == nil then
        _G.Flipper.config = require("flipper.config").options
    end

    _G.Flipper.state = M.toggle()
end

-- starts Flipper and set internal functions and state.
function Flipper.enable()
    if _G.Flipper.config == nil then
        _G.Flipper.config = require("flipper.config").options
    end

    local state = M.enable()

    if state ~= nil then
        _G.Flipper.state = state
    end

    return state
end

-- disables Flipper and reset internal functions and state.
function Flipper.disable()
    _G.Flipper.state = M.disable()
end

-- setup Flipper options and merge them with user provided ones.
function Flipper.setup(opts)
    _G.Flipper.config = require("flipper.config").setup(opts)
end

_G.Flipper = Flipper

return _G.Flipper
