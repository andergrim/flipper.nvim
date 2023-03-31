local M = require("flipper.main")
local Flipper = {}

function Flipper.flip()
    M.flip()
end

-- setup Flipper options and merge them with user provided ones.
function Flipper.setup(opts)
    _G.Flipper.config = require("flipper.config").setup(opts)
end

_G.Flipper = Flipper

return _G.Flipper
