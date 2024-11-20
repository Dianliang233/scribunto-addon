---@meta libraryUtil

---@class libraryUtil
---
---This library contains methods useful when implementing Scribunto libraries.
local libraryUtil = {}

--- Checks the type of an argument and raises an error if it does not match the expected type.
---
--- Raises an error if [`type(arg)`](lua://type) does not match `expectType`. In addition, no error will be raised if `arg` is nil and `nilOk` is true.
---
--- @param name string The name of the calling function.
--- @param argIdx number The position of the argument in the argument list.
--- @param arg any The argument to check.
--- @param expectType type The expected type of the argument.
--- @param nilOk boolean Whether nil is an acceptable value for the argument.
function libraryUtil.checkType(name, argIdx, arg, expectType, nilOk) end

--- Checks the type of an argument and raises an error if it does not match any of the expected types.
---
--- Raises an error if [`type(arg)`](lua://type) does not match any of the strings in the array `expectTypes`.
---
--- @param name string The name of the calling function.
--- @param argIdx number The position of the argument in the argument list.
--- @param arg any The argument to check.
--- @param expectTypes type[] The array of expected types for the argument.
function libraryUtil.checkTypeMulti(name, argIdx, arg, expectTypes) end

--- Checks the type of a value for a given index and raises an error if it does not match the expected type.
---
--- Raises an error if [`type(value)`](lua://type) does not match `expectType`.
---
--- This is intended for use in implementing a `__newindex` metamethod.
---
--- @param index any The index being assigned to.
--- @param value any The value being assigned.
--- @param expectType type The expected type of the value.
function libraryUtil.checkTypeForIndex(index, value, expectType) end

--- Checks the type of a named argument and raises an error if it does not match the expected type.
---
--- Raises an error if [`type(arg)`](lua://type) does not match `expectType`. In addition, no error will be raised if `arg` is nil and `nilOk` is true.
---
--- This is intended to be used as an equivalent to `libraryUtil.checkType` in methods called using Lua's "named argument" syntax, `func{ name = value }`.
---
--- @param name string The name of the calling function.
--- @param argName string The name of the argument.
--- @param arg any The argument to check.
--- @param expectType type The expected type of the argument.
--- @param nilOk boolean Whether nil is an acceptable value for the argument.
function libraryUtil.checkTypeForNamedArg(name, argName, arg, expectType, nilOk) end

--- Creates a function that checks if the self object is correct for a method call.
---
--- This is intended for use in implementing "methods" on object tables that are intended to be called with the `obj:method()` syntax.
---
--- @param libraryName string The name of the library.
--- @param varName string The name of the variable holding the self object.
--- @param selfObj any The expected self object.
--- @param selfObjDesc string A description of the self object.
--- @return function #A function that checks the self object.
function libraryUtil.makeCheckSelfFunction(libraryName, varName, selfObj, selfObjDesc) end

return libraryUtil
