--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local v = require("learn.lua_modules.tstl-validate.dist.index")
local ____utils = require("learn.utils")
local log = ____utils.log
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
return ____exports
