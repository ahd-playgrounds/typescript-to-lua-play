local ____lualib = require("learn.lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates an async non nullish schema.
-- 
-- @param wrapped The wrapped schema.
-- @param error The error message.
-- @returns An async non nullish schema.
function ____exports.nonNullishAsync(wrapped, ____error)
    return {
        schema = "non_nullish",
        wrapped = wrapped,
        async = true,
        _parse = function(self, input, info)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if input == nil or input == nil then
                    return ____awaiter_resolve(
                        nil,
                        {issues = {getIssue(info, {reason = "type", validation = "non_nullish", message = ____error or "Invalid type", input = input})}}
                    )
                end
                return ____awaiter_resolve(
                    nil,
                    wrapped:_parse(input, info)
                )
            end)
        end
    }
end
return ____exports
