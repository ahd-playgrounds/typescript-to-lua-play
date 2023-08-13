local ____lualib = require("learn.lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__Promise = ____lualib.__TS__Promise
local __TS__New = ____lualib.__TS__New
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local ____exports = {}
local ____result = require("learn.result")
local err = ____result.err
local ok = ____result.ok
local uv = vim.loop
function ____exports.openFile(path)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        return ____awaiter_resolve(
            nil,
            __TS__New(
                __TS__Promise,
                function(____, resolve)
                    uv.fs_open(
                        path,
                        "r",
                        438,
                        function(e, fd)
                            resolve(
                                nil,
                                e and err(e) or ok(fd)
                            )
                        end
                    )
                end
            )
        )
    end)
end
function ____exports.fstat(fd)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        return ____awaiter_resolve(
            nil,
            __TS__New(
                __TS__Promise,
                function(____, resolve)
                    uv.fs_fstat(
                        fd,
                        function(e, fd)
                            resolve(
                                nil,
                                e and err(e) or ok(fd)
                            )
                        end
                    )
                end
            )
        )
    end)
end
function ____exports.fsClose(fd)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        return ____awaiter_resolve(
            nil,
            __TS__New(
                __TS__Promise,
                function(____, resolve)
                    uv.fs_close(
                        fd,
                        function(e)
                            resolve(
                                nil,
                                e and err(e) or ok(nil)
                            )
                        end
                    )
                end
            )
        )
    end)
end
function ____exports.fsRead(fd, size)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        return ____awaiter_resolve(
            nil,
            __TS__New(
                __TS__Promise,
                function(____, resolve)
                    uv.fs_read(
                        fd,
                        size,
                        0,
                        function(e, fd)
                            resolve(
                                nil,
                                e and err(e) or ok(fd)
                            )
                        end
                    )
                end
            )
        )
    end)
end
return ____exports
