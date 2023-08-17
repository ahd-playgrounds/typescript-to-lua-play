--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Returns error and pipe from dynamic arguments.
-- 
-- @param arg1 First argument.
-- @param arg2 Second argument.
-- @returns The error and pipe.
function ____exports.getErrorAndPipe(arg1, arg2)
    local ____error, pipe = unpack((not arg1 or type(arg1) == "string") and ({arg1, arg2}) or ({nil, arg1}))
    if pipe == nil then
        pipe = {}
    end
    return {error = ____error, pipe = pipe}
end
return ____exports
