--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local executePipe = ____index.executePipe
local getPipeInfo = ____index.getPipeInfo
--- Creates a unknown schema.
-- 
-- @param pipe A validation and transformation pipe.
-- @returns A unknown schema.
function ____exports.unknown(pipe)
    if pipe == nil then
        pipe = {}
    end
    return {
        schema = "unknown",
        async = false,
        _parse = function(self, input, info)
            return executePipe(
                input,
                pipe,
                getPipeInfo(info, "unknown")
            )
        end
    }
end
return ____exports
