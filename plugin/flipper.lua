-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.FlipperLoaded then
    return
end

_G.FlipperLoaded = true

vim.api.nvim_create_user_command("Flipper", function()
    require("flipper").flip()
end, {})
