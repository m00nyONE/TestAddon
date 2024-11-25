TestAddon = TestAddon or {}
local TA = TestAddon

TA.name = "TestAddon"

local function Initialize()
    d("test")
end

-- register the addon
EVENT_MANAGER:RegisterForEvent(TA.name, EVENT_ADD_ON_LOADED, function(_, name)
    if name ~= LYM.name then return end
    EVENT_MANAGER:UnregisterForEvent(TA.name, EVENT_ADD_ON_LOADED)

    Initialize()
end)