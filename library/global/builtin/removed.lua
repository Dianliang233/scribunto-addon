-- LuaLS doesn't support picking and choosing which builtin function to be removed without redefining all of them.
-- So the next best thing is to mark them as deprecated. This does mean that they show up twice in the completion list.

---Removed in Scribunto.
---@deprecated
function collectgarbage(...) end

---Removed in Scribunto.
---@deprecated
function module(...) end

---Removed in Scribunto.
---@deprecated
function dofile(...) end

---Removed in Scribunto.
---@deprecated
function loadfile(...) end

---Removed in Scribunto.
---@deprecated
function load(...) end

---Removed in Scribunto.
---@deprecated
function loadstring(...) end

---Removed in Scribunto.
---@deprecated
function print(...) end

---Removed in Scribunto.
---@deprecated
---@diagnostic disable-next-line: duplicate-set-field
function string.dump(...) end
