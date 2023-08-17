local ____lualib = require("learn.lualib_bundle")
local __TS__Iterator = ____lualib.__TS__Iterator
local ____exports = {}
function ____exports.isLuaTable(input)
    if not input and type(input) ~= "table" then
        return false
    end
    local i = -1
    for ____, key in __TS__Iterator(input) do
        i = i + 1
        if key[i] == nil then
            return false
        end
    end
    return true
end
function ____exports.isLuaArray(input)
    if not input and type(input) ~= "table" then
        return false
    end
    local i = -1
    for ____, key in __TS__Iterator(input) do
        i = i + 1
        if key[i] ~= nil then
            return false
        end
    end
    return true
end
return ____exports
