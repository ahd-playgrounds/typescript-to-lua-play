local ____lualib = require("learn.lualib_bundle")
local Set = ____lualib.Set
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local __TS__Iterator = ____lualib.__TS__Iterator
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local executePipe = ____index.executePipe
local getErrorAndPipe = ____index.getErrorAndPipe
local getIssue = ____index.getIssue
local getPath = ____index.getPath
local getPathInfo = ____index.getPathInfo
local getPipeInfo = ____index.getPipeInfo
--- Creates a set schema.
-- 
-- @param value The value schema.
-- @param pipe A validation and transformation pipe.
-- @returns A set schema.
-- @param value The value schema.
-- @param error The error message.
-- @param pipe A validation and transformation pipe.
-- @returns A set schema.
function ____exports.set(value, arg2, arg3)
    local ____getErrorAndPipe_result_0 = getErrorAndPipe(arg2, arg3)
    local ____error = ____getErrorAndPipe_result_0.error
    local pipe = ____getErrorAndPipe_result_0.pipe
    return {
        schema = "set",
        set = {value = value},
        async = false,
        _parse = function(self, input, info)
            if not __TS__InstanceOf(input, Set) then
                return {issues = {getIssue(info, {reason = "type", validation = "set", message = ____error or "Invalid type", input = input})}}
            end
            local index = 0
            local issues
            local output = __TS__New(Set)
            for ____, inputValue in __TS__Iterator(input) do
                local ____value_9 = value
                local ____value__parse_10 = value._parse
                local ____getPathInfo_8 = getPathInfo
                local ____info_7 = info
                local ____getPath_6 = getPath
                local ____temp_5 = info and info.path
                local ____input_4 = input
                local ____index_3 = index
                index = ____index_3 + 1
                local result = ____value__parse_10(
                    ____value_9,
                    inputValue,
                    ____getPathInfo_8(
                        ____info_7,
                        ____getPath_6(____temp_5, {schema = "set", input = ____input_4, key = ____index_3, value = inputValue})
                    )
                )
                if result.issues then
                    if issues then
                        for ____, issue in ipairs(result.issues) do
                            issues[#issues + 1] = issue
                        end
                    else
                        issues = result.issues
                    end
                    if info and info.abortEarly then
                        break
                    end
                else
                    output:add(result.output)
                end
            end
            return issues and ({issues = issues}) or executePipe(
                output,
                pipe,
                getPipeInfo(info, "set")
            )
        end
    }
end
return ____exports
