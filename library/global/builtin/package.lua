---@meta package

---Loads the given module, returns any value returned by the searcher(`true` when `nil`). Besides that value, also returns as a second result the loader data returned by the searcher, which indicates how `require` found the module. (For instance, if the module came from a file, this loader data is the file path.)
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-require"])
---
---@param modname string
---@return unknown
---@return unknown loaderdata
function require(modname) end

---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package"])
---
---@class packagelib
---
---A table used by `require` to control which modules are already loaded.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.loaded"])
---
---@field loaded    table
---
---A table to store loaders for specific modules.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.preload"])
---
---@field preload   table
package = {}

---@version <5.1
---
---A table used by `require` to control how to load modules.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.loaders"])
---
package.loaders = {}

---
---Sets a metatable for `module` with its `__index` field referring to the global environment, so that this module inherits values from the global environment. To be used as an option to function `module` .
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.seeall"])
---
---@version <5.1
---@param module table
function package.seeall(module) end

return package
