local ____lualib = require("learn.lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates an async null schema.
-- 
-- @param error The error message.
-- @returns An async null schema.
function ____exports.nullTypeAsync(____error)
    return {
        schema = "null",
        async = true,
        _parse = function(self, input, info)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if input ~= nil then
                    return ____awaiter_resolve(
                        nil,
                        {issues = {getIssue(info, {reason = "type", validation = "null", message = ____error or "Invalid type", input = input})}}
                    )
                end
                return ____awaiter_resolve(nil, {output = input})
            end)
        end
    }
end
return ____exports
