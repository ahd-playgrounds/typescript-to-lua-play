--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates a never schema.
-- 
-- @param error The error message.
-- @returns A never schema.
function ____exports.never(____error)
    return {
        schema = "never",
        async = false,
        _parse = function(self, input, info)
            return {issues = {getIssue(info, {reason = "type", validation = "never", message = ____error or "Invalid type", input = input})}}
        end
    }
end
return ____exports
