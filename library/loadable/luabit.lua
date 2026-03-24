---@meta luabit

---@class luabit
---
---The [luabit](http://luaforge.net/projects/bit/) library provides bitwise operations and hexadecimal conversion functions.
---
---Note that the [bit32](lua://bit32) library contains the same operations as "luabit.bit", and the operations in "luabit.hex" may be performed using [string.format()](lua://string.format) and [tonumber()](lua://tonumber).
---
---The luabit module "noki" is not available, as it is entirely useless in Scribunto. The luabit module "utf8" is also not available, as it was considered redundant to the [Ustring library](lua://mw.ustring).
---
---@see luabit.bit
---@see luabit.hex
luabit = {}

-- no export
