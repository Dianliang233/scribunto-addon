---@meta luabit.bit

---@class luabit.bit
---
---The luabit.bit library provides [bitwise operations](https://en.wikipedia.org/wiki/Bitwise_operation). Note that the bit32 library contains the same operations as "luabit.bit".
local bit = {}

---Performs [bitwise AND](https://en.wikipedia.org/wiki/Bitwise_operation#AND) operation.
---@param m integer
---@param n integer
---@return integer
function bit.band(m, n) end

---Performs [bitwise complement](https://en.wikipedia.org/wiki/Bitwise_operation#NOT) of `x`.
---@param x integer
---@return integer
function bit.bnot(x) end

---Performs [bitwise OR](https://en.wikipedia.org/wiki/Bitwise_operation#OR) operation.
---@param m integer
---@param n integer
---@return integer
function bit.bor(m, n) end

---Performs [bitwise XOR](https://en.wikipedia.org/wiki/Bitwise_operation#XOR) operation.
---@param m integer
---@param n integer
---@return integer
function bit.bxor(m, n) end

---[Shifts](https://en.wikipedia.org/wiki/Bitwise_operation#Bit_shifts) `n` left by `disp` bits. This is a [logical shift](https://en.wikipedia.org/wiki/Logical_shift): inserted bits are 0. This is generally equivalent to multiplying by 2^disp.
---
---Note that a displacement over 31 will result in 0.
---@param n integer
---@param disp integer
---@return integer
function bit.lshift(n, disp) end

---[Shifts](https://en.wikipedia.org/wiki/Bitwise_operation#Bit_shifts) `n` right by `disp` bits. This is a [logical shift](https://en.wikipedia.org/wiki/Logical_shift): inserted bits are 0. This is generally equivalent to dividing by 2^disp.
---
---Note that a displacement over 31 will result in 0.
---@param n integer
---@param disp integer
---@return integer
function bit.rshift(n, disp) end

---Extracts bits from `n`.
---Accessing bits outside of the range 0 to 31 is an error.
---@param n integer
---@return (1 | 0)[] #A bit table (which is a 1/0 sequence).
function bit.tobits(n) end

---Converts a bit table into a number.
---@param bit_tbl (1 | 0)[]
---@return integer
function bit.tonumb(bit_tbl) end

return bit
