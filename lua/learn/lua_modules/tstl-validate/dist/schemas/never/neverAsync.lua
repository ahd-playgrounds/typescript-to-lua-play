local ____lualib = require("learn.lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getIssue = ____index.getIssue
--- Creates an async never schema.
-- 
-- @param error The error message.
-- @returns An async never schema.
function ____exports.neverAsync(____error)
    return {
        schema = "never",
        async = true,
        _parse = function(self, input, info)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                return ____awaiter_resolve(
                    nil,
                    {issues = {getIssue(info, {reason = "type", validation = "never", message = ____error or "Invalid type", input = input})}}
                )
            end)
        end
    }
end
return ____exports
