--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local executePipe = ____index.executePipe
local getErrorAndPipe = ____index.getErrorAndPipe
local getIssue = ____index.getIssue
local getPipeInfo = ____index.getPipeInfo
--- Creates a bigint schema.
-- 
-- @param pipe A validation and transformation pipe.
-- @returns A bigint schema.
-- @param error The error message.
-- @param pipe A validation and transformation pipe.
-- @returns A bigint schema.
function ____exports.bigint(arg1, arg2)
    local ____getErrorAndPipe_result_0 = getErrorAndPipe(arg1, arg2)
    local ____error = ____getErrorAndPipe_result_0.error
    local pipe = ____getErrorAndPipe_result_0.pipe
    return {
        schema = "bigint",
        async = false,
        _parse = function(self, input, info)
            if type(input) ~= "bigint" then
                return {issues = {getIssue(info, {reason = "type", validation = "bigint", message = ____error or "Invalid type", input = input})}}
            end
            return executePipe(
                input,
                pipe,
                getPipeInfo(info, "bigint")
            )
        end
    }
end
return ____exports
