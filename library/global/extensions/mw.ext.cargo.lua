---@meta mw.ext.cargo

---Lua API added by [Extension:Cargo](https://www.mediawiki.org/wiki/Extension:Cargo).
mw.ext.cargo = {}

---Queries the Cargo database. Similar to the [#cargo_query](https://www.mediawiki.org/wiki/Extension:Cargo/Querying_data##cargo_query) parser function.
---
---@param tables string
---@param fields string
---@param args table<string, any> Arguments for the query.
---@return table<string, any> #The query results.
function mw.ext.cargo.query(tables, fields, args) end

---Declares a Cargo table. Similar to the [#cargo_declare](https://www.mediawiki.org/wiki/Extension:Cargo/Storing_data#Declaring_a_table) parser function.
---
---@param args table<string, any>
function mw.ext.cargo.declare(args) end

---Stores a piece of data in a Cargo table. Similar to the [#cargo_store](https://www.mediawiki.org/wiki/Extension:Cargo/Storing_data#Storing_data_in_a_table) parser function.
---
---@param table string
---@param args table<string, any>
function mw.ext.cargo.store(table, args) end

return mw.ext.cargo
