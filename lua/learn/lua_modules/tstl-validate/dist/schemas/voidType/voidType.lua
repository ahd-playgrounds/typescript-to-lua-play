--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates a void schema.
-- 
-- @param error The error message.
-- @returns A void schema.
function ____exports.voidType(____error)
    return {
        schema = "void",
        async = false,
        _parse = function(self, input, info)
            if type(input) ~= "nil" then
                return {issues = {getIssue(info, {reason = "type", validation = "void", message = ____error or "Invalid type", input = input})}}
            end
            return {output = input}
        end
    }
end
return ____exports
