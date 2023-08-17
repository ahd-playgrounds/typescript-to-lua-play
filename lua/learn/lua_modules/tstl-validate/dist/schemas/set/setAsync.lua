local ____lualib = require("learn.lualib_bundle")
local Set = ____lualib.Set
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__ArrayFrom = ____lualib.__TS__ArrayFrom
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__PromiseAll = ____lualib.__TS__PromiseAll
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local executePipeAsync = ____index.executePipeAsync
local getErrorAndPipe = ____index.getErrorAndPipe
local getIssue = ____index.getIssue
local getPath = ____index.getPath
local getPathInfo = ____index.getPathInfo
local getPipeInfo = ____index.getPipeInfo
--- Creates an async set schema.
-- 
-- @param value The value schema.
-- @param pipe A validation and transformation pipe.
-- @returns An async set schema.
-- @param value The value schema.
-- @param error The error message.
-- @param pipe A validation and transformation pipe.
-- @returns An async set schema.
function ____exports.setAsync(value, arg2, arg3)
    local ____getErrorAndPipe_result_0 = getErrorAndPipe(arg2, arg3)
    local ____error = ____getErrorAndPipe_result_0.error
    local pipe = ____getErrorAndPipe_result_0.pipe
    return {
        schema = "set",
        set = {value = value},
        async = true,
        _parse = function(self, input, info)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if not __TS__InstanceOf(input, Set) then
                    return ____awaiter_resolve(
                        nil,
                        {issues = {getIssue(info, {reason = "type", validation = "set", message = ____error or "Invalid type", input = input})}}
                    )
                end
                local issues
                local output = __TS__New(Set)
                __TS__Await(__TS__PromiseAll(__TS__ArrayMap(
                    __TS__ArrayFrom(input:values()),
                    function(____, inputValue, index)
                        return __TS__AsyncAwaiter(function(____awaiter_resolve)
                            if not (info and info.abortEarly and issues) then
                                local result = __TS__Await(value:_parse(
                                    inputValue,
                                    getPathInfo(
                                        info,
                                        getPath(info and info.path, {schema = "set", input = input, key = index, value = inputValue})
                                    )
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
                                        output:add(result.output)
                                    end
                                end
                            end
                        end)
                    end
                )):catch(function() return nil end))
                return ____awaiter_resolve(
                    nil,
                    issues and ({issues = issues}) or executePipeAsync(
                        output,
                        pipe,
                        getPipeInfo(info, "set")
                    )
                )
            end)
        end
    }
end
return ____exports
