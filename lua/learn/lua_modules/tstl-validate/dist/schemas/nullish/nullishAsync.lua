local ____lualib = require("learn.lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
--- Creates an async nullish schema.
-- 
-- @param wrapped The wrapped schema.
-- @returns An async nullish schema.
function ____exports.nullishAsync(wrapped)
    return {
        schema = "nullish",
        wrapped = wrapped,
        async = true,
        _parse = function(self, input, info)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                if input == nil or input == nil then
                    return ____awaiter_resolve(nil, {output = input})
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
