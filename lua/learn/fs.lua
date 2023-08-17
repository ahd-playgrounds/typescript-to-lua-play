local ____lualib = require("learn.lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__Promise = ____lualib.__TS__Promise
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____tstl_2Dresult = require("learn.lua_modules.tstl-result.dist.index")
local fromPromise = ____tstl_2Dresult.fromPromise
local uv = vim.loop
local function identity(a)
    return a
end
function ____exports.openFile(path)
    return fromPromise(
        nil,
        __TS__New(
            __TS__Promise,
            function(____, resolve, reject)
                uv.fs_open(
                    path,
                    "r",
                    438,
                    function(e, fd)
                        local ____e_0
                        if e then
                            ____e_0 = reject(nil, e)
                        else
                            ____e_0 = resolve(nil, fd)
                        end
                    end
                )
            end
        ),
        identity
    )
end
function ____exports.fstat(fd)
    return fromPromise(
        nil,
        __TS__New(
            __TS__Promise,
            function(____, resolve, reject)
                uv.fs_fstat(
                    fd,
                    function(e, fd)
                        local ____e_1
                        if e then
                            ____e_1 = reject(nil, e)
                        else
                            ____e_1 = resolve(nil, fd)
                        end
                    end
                )
            end
        ),
        identity
    )
end
function ____exports.fsClose(fd)
    return fromPromise(
        nil,
        __TS__New(
            __TS__Promise,
            function(____, resolve, reject)
                uv.fs_close(
                    fd,
                    function(e)
                        local ____e_2
                        if e then
                            ____e_2 = reject(nil, e)
                        else
                            ____e_2 = resolve(nil, nil)
                        end
                    end
                )
            end
        ),
        identity
    )
end
function ____exports.fsRead(fd, size)
    return fromPromise(
        nil,
        __TS__New(
            __TS__Promise,
            function(____, resolve, reject)
                uv.fs_read(
                    fd,
                    size,
                    0,
                    function(e, fd)
                        local ____e_3
                        if e then
                            ____e_3 = reject(nil, e)
                        else
                            ____e_3 = resolve(nil, fd)
                        end
                    end
                )
            end
        ),
        identity
    )
end
return ____exports
