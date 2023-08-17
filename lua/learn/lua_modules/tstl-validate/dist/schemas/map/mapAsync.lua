local ____lualib = require("learn.lualib_bundle")
local Map = ____lualib.Map
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__PromiseAll = ____lualib.__TS__PromiseAll
local __TS__ArrayFrom = ____lualib.__TS__ArrayFrom
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local executePipeAsync = ____index.executePipeAsync
local getErrorAndPipe = ____index.getErrorAndPipe
local getIssue = ____index.getIssue
local getPath = ____index.getPath
local getPathInfo = ____index.getPathInfo
local getPipeInfo = ____index.getPipeInfo
--- Creates an async map schema.
-- 
-- @param key The key schema.
-- @param value The value schema.
-- @param pipe A validation and transformation pipe.
-- @returns An async map schema.
-- @param key The key schema.
-- @param value The value schema.
-- @param error The error message.
-- @param pipe A validation and transformation pipe.
-- @returns An async map schema.
function ____exports.mapAsync(key, value, arg3, arg4)
    local ____getErrorAndPipe_result_0 = getErrorAndPipe(arg3, arg4)
    local ____error = ____getErrorAndPipe_result_0.error
    local pipe = ____getErrorAndPipe_result_0.pipe
    return {
        schema = "map",
        map = {key = key, value = value},
        async = true,
        _parse = function(self, input, info)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if not __TS__InstanceOf(input, Map) then
                    return ____awaiter_resolve(
                        nil,
                        {issues = {getIssue(info, {reason = "type", validation = "map", message = ____error or "Invalid type", input = input})}}
                    )
                end
                local output = __TS__New(Map)
                local issues
                __TS__Await(__TS__PromiseAll(__TS__ArrayMap(
                    __TS__ArrayFrom(input:entries()),
                    function(____, inputEntry)
                        return __TS__AsyncAwaiter(function(____awaiter_resolve)
                            local inputKey = inputEntry[1]
                            local inputValue = inputEntry[2]
                            local path = getPath(info and info.path, {schema = "map", input = input, key = inputKey, value = inputValue})
                            local keyResult, valueResult = unpack(__TS__Await(__TS__PromiseAll(__TS__ArrayMap(
                                {{schema = key, input = inputKey, origin = "key"}, {schema = value, input = inputValue}},
                                function(____, ____bindingPattern0)
                                    local origin
                                    local input
                                    local schema
                                    schema = ____bindingPattern0.schema
                                    input = ____bindingPattern0.input
                                    origin = ____bindingPattern0.origin
                                    return __TS__AsyncAwaiter(function(____awaiter_resolve)
                                        if not (info and info.abortEarly and issues) then
                                            local result = __TS__Await(schema:_parse(
                                                input,
                                                getPathInfo(info, path, origin)
                                            ))
                                            if not (info and info.abortEarly and issues) then
                                                if result.issues then
                                                    if issues then
                                                        for ____, issue in ipairs(result.issues) do
                                                            issues[#issues + 1] = issue
                                                        end
                                                    else
                                                        issues = result.issues
                                                    end
                                                    if info and info.abortEarly then
                                                        error(nil, 0)
                                                    end
                                                else
                                                    return ____awaiter_resolve(nil, result)
                                                end
                                            end
                                        end
                                    end)
                                end
                            )):catch(function() return {} end)))
                            if keyResult and valueResult then
                                output:set(keyResult.output, valueResult.output)
                            end
                        end)
                    end
                )))
                return ____awaiter_resolve(
                    nil,
                    issues and ({issues = issues}) or executePipeAsync(
                        output,
                        pipe,
                        getPipeInfo(info, "map")
                    )
                )
            end)
        end
    }
end
return ____exports
