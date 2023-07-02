local ____lualib = require("learn.lualib_bundle")
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local ____exports = {}
function ____exports.default(names)
    return __TS__ArrayFilter(
        names,
        function(____, n) return n == "bret" end
    )
end
return ____exports
