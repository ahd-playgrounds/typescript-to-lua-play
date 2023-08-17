local ____lualib = require("learn.lualib_bundle")
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates an async enum schema.
-- 
-- @param nativeEnum The native enum value.
-- @param error The error message.
-- @returns An async enum schema.
function ____exports.nativeEnumAsync(nativeEnum, ____error)
    return {
        schema = "native_enum",
        nativeEnum = nativeEnum,
        async = true,
        _parse = function(self, input, info)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if not __TS__ArrayIncludes(
                    __TS__ObjectValues(nativeEnum),
                    input
                ) then
                    return ____awaiter_resolve(
                        nil,
                        {issues = {getIssue(info, {reason = "type", validation = "native_enum", message = ____error or "Invalid type", input = input})}}
                    )
                end
                return ____awaiter_resolve(nil, {output = input})
            end)
        end
    }
end
return ____exports
