---@meta mw.ext.VariablesLua

---@class mw.ext.VariablesLua
---
---Lua API added by [Extension:VariablesLua](https://www.mediawiki.org/wiki/Extension:VariablesLua).
mw.ext.VariablesLua = {}

---Stores the given value under the given name.
---An empty string is stored if the value is nil.
---@see mw.ext.VariablesLua.vardefineecho for a version that returns the value.
---@param name string The name under which the value is stored.
---@param value string | nil The value to store.
function mw.ext.VariablesLua.vardefine(name, value) end

---Stores the given value under the given name and returns the value.
---An empty string is stored if the value is nil.
---
---@see mw.ext.VariablesLua.vardefine for a version that does not return the value.
---@param name string The name under which the value is stored.
---@param value string | nil The value to store.
---@return string #The stored value.
function mw.ext.VariablesLua.vardefineecho(name, value) end

---Retrieves the value stored under the given name.
---Returns the default value if the variable is not set.
---@param name string The name of the variable to retrieve.
---@param default string | nil The default value to return if the variable is not set.
---@return string #The retrieved value or the default value.
function mw.ext.VariablesLua.var(name, default) end

---Checks if a variable with the given name exists.
---@param name string The name of the variable to check.
---@return boolean #True if the variable exists, false otherwise.
function mw.ext.VariablesLua.varexists(name) end

---Returns the last value stored under the given name.
---The value can only be returned and not used in the Lua code.
---@param name string The name of the variable to retrieve.
---@param default string | nil The default value to return if the variable is not set.
---@return string #The last stored value or the default value.
function mw.ext.VariablesLua.var_final(name, default) end

-- no export
