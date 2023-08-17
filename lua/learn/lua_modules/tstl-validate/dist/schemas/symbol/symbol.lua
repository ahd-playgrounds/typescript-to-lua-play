--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates a symbol schema.
-- 
-- @param error The error message.
-- @returns A symbol schema.
function ____exports.symbol(____error)
    return {
        schema = "symbol",
        async = false,
        _parse = function(self, input, info)
            if type(input) ~= "symbol" then
                return {issues = {getIssue(info, {reason = "type", validation = "symbol", message = ____error or "Invalid type", input = input})}}
            end
            return {output = input}
        end
    }
end
return ____exports
