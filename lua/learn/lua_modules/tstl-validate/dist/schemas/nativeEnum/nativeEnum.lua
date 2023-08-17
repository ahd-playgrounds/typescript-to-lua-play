local ____lualib = require("learn.lualib_bundle")
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates a enum schema.
-- 
-- @param nativeEnum The native enum value.
-- @param error The error message.
-- @returns A enum schema.
function ____exports.nativeEnum(nativeEnum, ____error)
    return {
        schema = "native_enum",
        nativeEnum = nativeEnum,
        async = false,
        _parse = function(self, input, info)
            if not __TS__ArrayIncludes(
                __TS__ObjectValues(nativeEnum),
                input
            ) then
                return {issues = {getIssue(info, {reason = "type", validation = "native_enum", message = ____error or "Invalid type", input = input})}}
            end
            return {output = input}
        end
    }
end
return ____exports
