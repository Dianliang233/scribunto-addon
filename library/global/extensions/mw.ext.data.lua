---@meta mw.ext.data

---@class mw.ext.data
---@see mw.ext.data.get
---
---Lua API added by [Extension:JsonConfig](https://www.mediawiki.org/wiki/Extension:JsonConfig).
mw.ext.data = {}

---Returns data page as a data table.
---@param title string Name of the page in the Data namespace.
---@param language string Language code. If `"_"` is given, returns all codes.
---@return table #The data table.
function mw.ext.data.get(title, language) end

-- no export
