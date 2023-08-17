--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates a null schema.
-- 
-- @param error The error message.
-- @returns A null schema.
function ____exports.nullType(____error)
    return {
        schema = "null",
        async = false,
        _parse = function(self, input, info)
            if input ~= nil then
                return {issues = {getIssue(info, {reason = "type", validation = "null", message = ____error or "Invalid type", input = input})}}
            end
            return {output = input}
        end
    }
end
return ____exports
