local ____lualib = require("learn.lualib_bundle")
local Map = ____lualib.Map
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
--- Creates a map schema.
-- 
-- @param key The key schema.
-- @param value The value schema.
-- @param pipe A validation and transformation pipe.
-- @returns A map schema.
-- @param key The key schema.
-- @param value The value schema.
-- @param error The error message.
-- @param pipe A validation and transformation pipe.
-- @returns A map schema.
function ____exports.map(key, value, arg3, arg4)
    local ____getErrorAndPipe_result_0 = getErrorAndPipe(arg3, arg4)
    local ____error = ____getErrorAndPipe_result_0.error
    local pipe = ____getErrorAndPipe_result_0.pipe
    return {
        schema = "map",
        map = {key = key, value = value},
        async = false,
        _parse = function(self, input, info)
            if not __TS__InstanceOf(input, Map) then
                return {issues = {getIssue(info, {reason = "type", validation = "map", message = ____error or "Invalid type", input = input})}}
            end
            local issues
            local output = __TS__New(Map)
            for ____, inputEntry in __TS__Iterator(input:entries()) do
                local inputKey = inputEntry[1]
                local inputValue = inputEntry[2]
                local path = getPath(info and info.path, {schema = "map", input = input, key = inputKey, value = inputValue})
                local keyResult = key:_parse(
                    inputKey,
                    getPathInfo(info, path, "key")
                )
                if keyResult.issues then
                    if issues then
                        for ____, issue in ipairs(keyResult.issues) do
                            issues[#issues + 1] = issue
                        end
                    else
                        issues = keyResult.issues
                    end
                    if info and info.abortEarly then
                        break
                    end
                end
                local valueResult = value:_parse(
                    inputValue,
                    getPathInfo(info, path)
                )
                if valueResult.issues then
                    if issues then
                        for ____, issue in ipairs(valueResult.issues) do
                            issues[#issues + 1] = issue
                        end
                    else
                        issues = valueResult.issues
                    end
                    if info and info.abortEarly then
                        break
                    end
                end
                if not keyResult.issues and not valueResult.issues then
                    output:set(keyResult.output, valueResult.output)
                end
            end
            return issues and ({issues = issues}) or executePipe(
                output,
                pipe,
                getPipeInfo(info, "map")
            )
        end
    }
end
return ____exports
