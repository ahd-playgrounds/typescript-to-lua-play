local ____lualib = require("learn.lualib_bundle")
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates a strict object schema that throws an error if an input contains
-- unknown keys.
-- 
-- @param schema A object schema.
-- @param error The error message.
-- @returns A strict object schema.
function ____exports.strict(schema, ____error)
    return __TS__ObjectAssign(
        {},
        schema,
        {_parse = function(self, input, info)
            local result = schema:_parse(input, info)
            return not result.issues and #__TS__ObjectKeys(input) ~= #__TS__ObjectKeys(result.output) and ({issues = {getIssue(info, {reason = "object", validation = "strict", message = ____error or "Invalid keys", input = input})}}) or result
        end}
    )
end
return ____exports
