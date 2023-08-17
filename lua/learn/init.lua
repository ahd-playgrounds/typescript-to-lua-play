local ____lualib = require("learn.lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__Promise = ____lualib.__TS__Promise
local ____exports = {}
local v = require("learn.lua_modules.tstl-validate.dist.index")
local ____utils = require("learn.utils")
local log = ____utils.log
local ____fs = require("learn.fs")
local fsClose = ____fs.fsClose
local fsRead = ____fs.fsRead
local fstat = ____fs.fstat
local openFile = ____fs.openFile
local ____timer = require("learn.timer")
local clearInterval = ____timer.clearInterval
local setInterval = ____timer.setInterval
local wait = ____timer.wait
local uv = vim.loop
v.safeParse(
    v.array(v.number()),
    {1, 2, 3}
):mapErr(function(e) return log(e) end)
v.safeParse(
    v.array(
        v.number(),
        {v.minLength(1)}
    ),
    {}
):mapErr(function(e) return log(e) end)
v.safeParse(
    v.array(
        v.number(),
        {v.minLength(1)}
    ),
    {}
):mapErr(function(e) return log(e) end)
function ____exports.main(file)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        vim.print("prog main begun")
        local LoginSchema = v.object({
            email = v.string("must have email"),
            password = v.string(
                "must have pwd",
                {v.minLength(8, "too short")}
            )
        })
        v.safeParse(
            v.object({fo = v.string()}),
            88
        ):mapErr(function(e) return log(e) end)
        v.safeParse(LoginSchema, {email = "hello", password = "my wrod"}):match(
            function(d) return log({d = d}) end,
            function(e) return log({e = e}) end
        )
        local ____try = __TS__AsyncAwaiter(function()
            local s = __TS__Await(openFile(file):mapErr(function(e) return log({e = e}) end):map(function(fd)
                return fstat(fd):andThen(function(stat) return fsRead(fd, stat.size) end):andThen(function(content) return fsClose(fd):map(function() return content end) end):match(
                    function(file) return log({file = file}) end,
                    function(err) return log({err = err}) end
                )
            end))
            __TS__Await(wait(1000))
            vim.print("prog ok ")
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
local ____self_0 = ____exports.main("./tsconfig.json")
local h = ____self_0["then"](
    ____self_0,
    function()
        vim.print("done\n")
        uv.stop()
    end
)
local count = 0
local t
t = setInterval(
    function()
        count = count + 1
        local alive = vim.loop.loop_alive()
        log({alive = alive})
        if count > 4 then
            clearInterval(t)
        end
        if alive then
        else
            uv.stop()
        end
    end,
    200
)
vim.print("prog maine end")
log(uv.run())
vim.print("prog run end")
return ____exports
