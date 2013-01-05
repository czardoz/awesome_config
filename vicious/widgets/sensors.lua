---------------------------------------------------
-- Licensed under the GNU General Public License v2
-- * (c) 2010, Xezzus
---------------------------------------------------
-- {{{ Grab environment
local io = { popen = io.popen }
local setmetatable = setmetatable
-- }}}
--
-- Date: provides access to os.date with optional custom formatting
module("vicious.widgets.sensors")

-- {{{ Date widget type
local function worker()

--f = io.popen("sensors | awk '/Core 0/ {print($3)}'")
f = io.popen("sensors | awk '/Core 0/ {print($3)}' | awk -F '[+.]' '{print($2)}'")

for line in f:lines() do
coreone = line
end

--f = io.popen("sensors | awk '/Core 1/ {print($3)}'")
f = io.popen("sensors | awk '/Core 1/ {print($3)}' | awk -F '[+.]' '{print($2)}'")

for line in f:lines() do
coretwo = line
end

return " " .. coreone .. "°" .. " · " .. coretwo .. "° "
end
-- }}}

setmetatable(_M, { __call = function(_, ...) return worker(...) end })

