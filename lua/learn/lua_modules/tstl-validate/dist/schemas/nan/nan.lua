local ____lualib = require("learn.lualib_bundle")
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates a NaN schema.
-- 
-- @param error The error message.
-- @returns A NaN schema.
function ____exports.nan(____error)
    return {
        schema = "nan",
        async = false,
        _parse = function(self, input, info)
            if not __TS__NumberIsNaN(input) then
                return {issues = {getIssue(info, {reason = "type", validation = "nan", message = ____error or "Invalid type", input = input})}}
            end
            return {output = input}
        end
    }
end
return ____exports
