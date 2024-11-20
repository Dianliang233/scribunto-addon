---@meta luabit.hex

---@class luabit.hex
---
---The luabit.hex library provides [bitwise operations](https://en.wikipedia.org/wiki/Bitwise_operation). Note that these operations may be performed using [`string.format()`](lua://string.format) and [`tonumber()`](lua://tonumber) with the base argument set to 16 instead.
local hex = {}

---Converts a number to a hexadecimal string.
---@param n number The number to convert.
---@return string #The hexadecimal representation of the number.
function hex.to_hex(n) end

---Converts a hexadecimal string to a number.
---@param hex_str string The hexadecimal string to convert. It should be prefixed with '0x' or '0X'.
---@return number #The decimal representation of the hexadecimal string.
function hex.to_dec(hex_str) end

return hex
