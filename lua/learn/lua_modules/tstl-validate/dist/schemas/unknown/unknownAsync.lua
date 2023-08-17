local ____lualib = require("learn.lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local executePipeAsync = ____index.executePipeAsync
local getPipeInfo = ____index.getPipeInfo
--- Creates an async unknown schema.
-- 
-- @param pipe A validation and transformation pipe.
-- @returns An async unknown schema.
function ____exports.unknownAsync(pipe)
    if pipe == nil then
        pipe = {}
    end
    return {
        schema = "unknown",
        async = true,
        _parse = function(self, input, info)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                return ____awaiter_resolve(
                    nil,
                    executePipeAsync(
                        input,
                        pipe,
                        getPipeInfo(info, "unknown")
                    )
                )
            end)
        end
    }
end
return ____exports
