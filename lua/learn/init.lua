local ____lualib = require("learn.lualib_bundle")
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__Promise = ____lualib.__TS__Promise
local ____exports = {}
local ____utils = require("learn.utils")
local log = ____utils.log
local ____timer = require("learn.timer")
local setInterval = ____timer.setInterval
local wait = ____timer.wait
local uv = vim.loop
local function main(file)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        vim.print("prog main begun")
        local ____try = __TS__AsyncAwaiter(function()
            __TS__Await(wait(1000))
        end)
        __TS__Await(____try.catch(
            ____try,
            function(____, e)
                vim.print("prog read error")
                vim.print(e)
            end
        ))
    end)
end
vim.print("prog start")
local ____self_0 = main("./tsconfig.json")
local h = ____self_0["then"](
    ____self_0,
    function()
        vim.print("done\n")
    end
)
local t = setInterval(
    function()
        local alive = vim.loop.loop_alive()
        log({alive = alive})
        if alive then
        else
            uv.stop()
        end
    end,
    200
)
vim.print("prog maine end")
uv.loop_configure("block_signal", "sigprof")
log(uv.run())
vim.print("prog run end")
return ____exports
