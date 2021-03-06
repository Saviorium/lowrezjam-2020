Debug = {
    DrawDebugForPlayer = 0,
    DrawDebugForMapPiece = 0,
    DrawDebugColliders = 0,
    LogEvents = 0,
    LogLevelNames = 0,
    ShowFps = 1
}

-- usage: vardump(x1, test, myVar) or vardump({ship = self, dt = dt})
vardump = function(...)
    local args = {...}
    print("================VARDUMP=====================")
    if #args == 1 then
        print(serpent.block(args))
    else
        for key, value in pairs(args) do
            if key then print(key..':') end
            print(serpent.block(value))
        end
    end
    print("============================================")
end

return Debug
