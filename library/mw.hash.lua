---@meta mw.hash

---Hashing functions provided by Scribunto.
mw.hash = {}

---Hashes a string value with the specified algorithm. Valid algorithms may be fetched using [mw.hash.listAlgorithms()](lua://mw.hash.listAlgorithms).
---@param algo string The hash algorithm to use.
---@param value string The value to hash.
---@returns string #The hashed value.
function mw.hash.hashValue(algo, value) end

---Lists the available hash algorithms.
---@return table<string> #A list of available hash algorithms.
function mw.hash.listAlgorithms() end

-- no export
