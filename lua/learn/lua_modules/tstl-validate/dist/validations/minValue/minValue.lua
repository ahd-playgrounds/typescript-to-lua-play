--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates a validation functions that validates the value of a string, number or date.
-- 
-- @param requirement The minimum value.
-- @param error The error message.
-- @returns A validation function.
function ____exports.minValue(requirement, ____error)
    return function(input, info)
        if input < requirement then
            return {issues = {getIssue(info, {validation = "min_value", message = ____error or "Invalid value", input = input})}}
        end
        return {output = input}
    end
end
--- See {@link minValue}
-- 
-- @deprecated Function has been renamed to `minValue`.
____exports.minRange = ____exports.minValue
return ____exports
