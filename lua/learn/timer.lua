local ____lualib = require("learn.lualib_bundle")
local __TS__Promise = ____lualib.__TS__Promise
local __TS__New = ____lualib.__TS__New
local ____exports = {}
function ____exports.clearInterval(timer)
    timer:stop()
    timer:close()
end
function ____exports.setTimeout(cb, duration)
    local timer = vim.loop.new_timer()
    timer:start(
        duration,
        0,
        function()
            ____exports.clearInterval(timer)
            cb()
        end
    )
    return timer
end
function ____exports.setInterval(cb, duration)
    local timer = vim.loop.new_timer()
    timer:start(
        duration,
        duration,
        function()
            cb()
        end
    )
    return timer
end
function ____exports.wait(duration)
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            ____exports.setTimeout(
                function()
                    resolve(nil)
                end,
                duration
            )
        end
    )
end
return ____exports
