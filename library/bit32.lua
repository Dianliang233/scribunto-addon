---@meta bit32

---@class bit32
---
---The bit32 library provides [bitwise operations](https://en.wikipedia.org/wiki/Bitwise_operation) on unsigned 32-bit integers. Input numbers are truncated to integers (in an unspecified manner) and reduced modulo 2^32 so the value is in the range 0 to 2^32−1; return values are also in this range.
---
---When bits are numbered (as in [bit32.extract()](lua://bit32.extract)), 0 is the least-significant bit (the one with value 2^0) and 31 is the most-significant (the one with value 2^31).
local bit32 = {}

---Performs [bitwise AND](https://en.wikipedia.org/wiki/Bitwise_operation#AND) operation.
---@param ... integer
---@return integer
function bit32.band(...) end

---Performs [bitwise complement](https://en.wikipedia.org/wiki/Bitwise_operation#NOT) of `x`.
---@param x integer
---@return integer
function bit32.bnot(x) end

---Performs [bitwise OR](https://en.wikipedia.org/wiki/Bitwise_operation#OR) operation.
---@param ... integer
---@return integer
function bit32.bor(...) end

---Equivalent to `bit32.band(...) ~= 0`.
---@param ... integer
---@return boolean
function bit32.btest(...) end

---Performs [bitwise XOR](https://en.wikipedia.org/wiki/Bitwise_operation#XOR) operation.
---@param ... integer
---@return integer
function bit32.bxor(...) end

---Extracts `width` bits from `n`, starting with bit field.
---Accessing bits outside of the range 0 to 31 is an error.
---@param n integer
---@param field integer
---@param width integer Defaults to 1.
---@return integer
function bit32.extract(n, field, width) end

---Replaces `width` bits in `n`, starting with bit field, with the low `width` bits from `v`.
---Accessing bits outside of the range 0 to 31 is an error.
---@param n integer
---@param v integer
---@param field integer
---@param width integer Defaults to 1.
---@return integer
function bit32.replace(n, v, field, width) end

---[Shifts](https://en.wikipedia.org/wiki/Bitwise_operation#Bit_shifts) `n` left by `disp` bits. This is a [logical shift](https://en.wikipedia.org/wiki/Logical_shift): inserted bits are 0. This is generally equivalent to multiplying by 2^disp.
---
---Note that a displacement over 31 will result in 0.
---@param n integer
---@param disp integer
---@return integer
function bit32.lshift(n, disp) end

---[Shifts](https://en.wikipedia.org/wiki/Bitwise_operation#Bit_shifts) `n` right by `disp` bits. This is a [logical shift](https://en.wikipedia.org/wiki/Logical_shift): inserted bits are 0. This is generally equivalent to dividing by 2^disp.
---
---Note that a displacement over 31 will result in 0.
---@param n integer
---@param disp integer
---@return integer
function bit32.rshift(n, disp) end

---[Shifts](https://en.wikipedia.org/wiki/Bitwise_operation#Bit_shifts) `n` right by `disp` bits. This is an [arithmetic shift](https://en.wikipedia.org/wiki/Arithmetic_shift): if `disp` is positive, the inserted bits will be the same as bit 31 in the original number.
---
---Note that a displacement over 31 will result in 0 or 4294967295.
---@param n integer
---@param disp integer
---@return integer
function bit32.arshift(n, disp) end

---[Rotates](https://en.wikipedia.org/wiki/Bitwise_operation#Rotate_no_carry) `n` left by `disp` bits.
---Note that rotations are equivalent modulo 32: a rotation of 32 is the same as a rotation of 0, 33 is the same as 1, and so on.
---@param n integer
---@param disp integer
---@return integer
function bit32.lrotate(n, disp) end

---[Rotates](https://en.wikipedia.org/wiki/Bitwise_operation#Rotate_no_carry) `n` right by `disp` bits.
---Note that rotations are equivalent modulo 32: a rotation of 32 is the same as a rotation of 0, 33 is the same as 1, and so on.
---@param n integer
---@param disp integer
---@return integer
function bit32.rrotate(n, disp) end

return bit32
