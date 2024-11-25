TestAddon = {
    name = "TestAddon",
    version = "dev",
}

local TA = TestAddon

local function _createSlashCommands()
    SLASH_COMMANDS["/testaddon"] = function(args)
        d(TA.name .." is running")
        d("input: " .. args)
    end
end

local function Initialize()
    d("test")
end

-- register the addon
EVENT_MANAGER:RegisterForEvent(TA.name, EVENT_ADD_ON_LOADED, function(_, name)
    if name ~= TA.name then return end
    EVENT_MANAGER:UnregisterForEvent(TA.name, EVENT_ADD_ON_LOADED)

    Initialize()
    _createSlashCommands()
end)