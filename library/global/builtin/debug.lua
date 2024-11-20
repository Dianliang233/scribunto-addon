---@meta debug

---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-debug"])
---
---@class debuglib
debug = {}

---Returns a string with a traceback of the call stack. The optional message string is appended at the beginning of the traceback.
---
---[View documents](command:extension.lua.doc?["en-us/51/manual.html/pdf-debug.traceback"])
---
---@overload fun(message?: any, level?: integer): string
---@param thread   thread
---@param message? any
---@param level?   integer
---@return string  message
---@nodiscard
function debug.traceback(thread, message, level) end
