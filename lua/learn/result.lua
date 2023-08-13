local ____lualib = require("learn.lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__Promise = ____lualib.__TS__Promise
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
____exports.ok = function(arg) return {
    ok = true,
    val = arg,
    map = function(____, cb) return ____exports.ok(cb(arg)) end,
    errMap = function() return ____exports.ok(arg) end,
    flatMap = function(____, cb) return cb(arg) end,
    chain = function(____, cb) return __TS__AsyncAwaiter(function(____awaiter_resolve)
        return ____awaiter_resolve(
            nil,
            cb(arg)
        )
    end) end,
    match = function(____, ____bindingPattern0)
        local Ok
        Ok = ____bindingPattern0.Ok
        return Ok(nil, arg)
    end,
    unwrap = function(____, _) return arg end
} end
____exports.err = function(arg) return {
    ok = false,
    reason = arg,
    map = function() return ____exports.err(arg) end,
    errMap = function(____, cb) return ____exports.err(cb(arg)) end,
    flatMap = function() return ____exports.err(arg) end,
    chain = function() return __TS__AsyncAwaiter(function(____awaiter_resolve)
        return ____awaiter_resolve(
            nil,
            __TS__Promise.resolve(____exports.err(arg))
        )
    end) end,
    match = function(____, ____bindingPattern0)
        local Err
        Err = ____bindingPattern0.Err
        return Err(nil, arg)
    end,
    unwrap = function(____, msg)
        error(
            __TS__New(Error, msg or "Unwrapped Result of type Err!"),
            0
        )
    end
} end
____exports.isErr = function(result) return not result.ok end
____exports.isOk = function(result) return result.ok end
function ____exports.tupleResult(result1, result2)
    return result1:flatMap(function(ok1) return result2:map(function(ok2) return {ok1, ok2} end) end)
end
return ____exports
