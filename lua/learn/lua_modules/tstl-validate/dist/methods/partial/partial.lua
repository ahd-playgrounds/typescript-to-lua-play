local ____lualib = require("learn.lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local ____exports = {}
local ____index = require("learn.lua_modules.tstl-validate.dist.schemas.index")
local object = ____index.object
local optional = ____index.optional
local ____index = require("learn.lua_modules.tstl-validate.dist.utils.index")
local getErrorAndPipe = ____index.getErrorAndPipe
--- Creates an object schema consisting of all properties of an existing object
-- schema set to optional.
-- 
-- @param schema The affected schema.
-- @param pipe A validation and transformation pipe.
-- @returns An object schema.
-- @param schema The affected schema.
-- @param error The error message.
-- @param pipe A validation and transformation pipe.
-- @returns An object schema.
function ____exports.partial(schema, arg3, arg4)
    local ____getErrorAndPipe_result_0 = getErrorAndPipe(arg3, arg4)
    local ____error = ____getErrorAndPipe_result_0.error
    local pipe = ____getErrorAndPipe_result_0.pipe
    return object(
        __TS__ArrayReduce(
            __TS__ObjectEntries(schema.object),
            function(____, object, ____bindingPattern0)
                local schema
                local key
                key = ____bindingPattern0[1]
                schema = ____bindingPattern0[2]
                return __TS__ObjectAssign(
                    {},
                    object,
                    {[key] = optional(schema)}
                )
            end,
            {}
        ),
        ____error,
        pipe
    )
end
return ____exports