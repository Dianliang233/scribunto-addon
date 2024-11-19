---@meta mw

---Libraries functions provided by [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto).
mw = {}

---Adds a warning which is displayed above the preview when previewing an edit.
---@param text string Text for the warning. Parsed as wikitext.
---@return nil
function mw.addWarning(text) end

---Calls [tostring()](lua://tostring) on all arguments, then concatenates them with tabs as separators.
---@param ... any Values to concatenate.
---@return string #Concatenated string.
function mw.allToString(...) end

---@generic T
---Creates a deep copy of a value. All tables (and their metatables) are reconstructed from scratch.
---Functions are still shared, however.
---@param value `T` Value to clone.
---@return `T` cloned value.
function mw.clone(value) end

---Returns the current [frame object](lua://frame), typically the frame object from the most recent `#invoke`.
---@return frame
function mw.getCurrentFrame() end

---Adds one to the "expensive parser function" count, and throws an exception if it exceeds the limit
---(see [$wgExpensiveParserFunctionLimit](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)).
---@return nil
function mw.incrementExpensiveFunctionCount() end

---Query if the current #invoke is being [subst'ed](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Substitution).
---See [Returning text](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Returning_text) for discussion on differences when subst'ing versus not subst'ing.
---@return boolean #True if the current #invoke is being subst'ed, false otherwise.
function mw.isSubsting() end

---Works like [require()](lua://require), with the following differences:
---- The loaded module is evaluated only once per page, rather than once per `{{#invoke:}}` call.
---- The loaded module is not recorded in [package.loaded](lua://package.loaded).
---- The value returned from the loaded module must be a table. Other data types are not supported.
---- The returned table (and all subtables) may contain only booleans, numbers, strings, and other tables.Other data types, particularly functions, are not allowed.
---- The returned table (and all subtables) may not have a metatable.
---- All table keys must be booleans, numbers, or strings.
---- The table actually returned by `mw.loadData()` has metamethods that provide read-only access to the table returned by the module. Since it does not contain the data directly, [`pairs()`](lua://pairs) and [`ipairs()`](lua://ipairs) will work but other methods, including `#value`, [`next()`](lua://next), and the functions in the Table library, will not work correctly.
---@param module string
---@return unknown
---@return unknown loaderdata
function mw.loadData(module) end

---Load data from JSON pages. The JSON content must be an array or object.
---@see mw.text.jsonDecode
---@param page string The page to load the JSON data from.
---@return table #The JSON data.
function mw.loadJsonData(page) end

---Serializes object to a human-readable representation.
---@param object any Object to serialize.
---@return string #Serialized string.
function mw.dumpObject(object) end

---Passes the arguments to mw.allToString(), then appends the resulting string to the log buffer.
---In the debug console, the function `print()` is an alias for this function.
---@param ... any Values to log.
function mw.log(...) end

---Calls mw.dumpObject() and appends the resulting string to the log buffer.
---@param object any Object to log.
---@param prefix string If given, added to the log buffer followed by an equals sign before the serialized string is appended (i.e. the logged text will be "prefix = object-string").
---@overload fun(object: any): nil
function mw.logObject(object, prefix) end

-- no export
