local ____lualib = require("learn.lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local executePipeAsync = ____index.executePipeAsync
local getErrorAndPipe = ____index.getErrorAndPipe
local getIssue = ____index.getIssue
local getPipeInfo = ____index.getPipeInfo
--- Creates an async bigint schema.
-- 
-- @param pipe A validation and transformation pipe.
-- @returns An async bigint schema.
-- @param error The error message.
-- @param pipe A validation and transformation pipe.
-- @returns An async bigint schema.
function ____exports.bigintAsync(arg1, arg2)
    local ____getErrorAndPipe_result_0 = getErrorAndPipe(arg1, arg2)
    local ____error = ____getErrorAndPipe_result_0.error
    local pipe = ____getErrorAndPipe_result_0.pipe
    return {
        schema = "bigint",
        async = true,
        _parse = function(self, input, info)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if type(input) ~= "bigint" then
                    return ____awaiter_resolve(
                        nil,
                        {issues = {getIssue(info, {reason = "type", validation = "bigint", message = ____error or "Invalid type", input = input})}}
                    )
                end
                return ____awaiter_resolve(
                    nil,
                    executePipeAsync(
                        input,
                        pipe,
                        getPipeInfo(info, "bigint")
                    )
                )
            end)
        end
    }
end
return ____exports
