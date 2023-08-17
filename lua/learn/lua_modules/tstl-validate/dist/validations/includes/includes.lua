local ____lualib = require("learn.lualib_bundle")
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates a validation functions that validates the content of a string or array.
-- 
-- @param requirement The content to be included.
-- @param error The error message.
-- @returns A validation function.
function ____exports.includes(requirement, ____error)
    return function(input, info)
        if not __TS__StringIncludes(input, requirement) then
            return {issues = {getIssue(info, {validation = "includes", message = ____error or "Invalid content", input = input})}}
        end
        return {output = input}
    end
end
return ____exports
