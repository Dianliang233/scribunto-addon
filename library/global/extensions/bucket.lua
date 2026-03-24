---@meta mw.ext.bucket

---@class bucket
---@overload fun(bucket: string): QueryBuilder
---
---Lua API added by [Bucket](https://meta.weirdgloop.org/w/Extension:Bucket/Usage).
---
---Can be called with a single parameter which is the name of the bucket. Must be a valid bucket name as defined in the Bucket namespace.
---@return QueryBuilder #A new QueryBuilder instance.
bucket = {}

---@alias Condition
---| string[] #Table of two or three entries, in the format of `{Selector, Operand, Value}` or `{Selector, Value}`. In the case of two entries, the operand is implied to be `=`. Operand is one of `=`, `!=`, `>`, `<`, `>=`, `<=`.
---| string #Name of a category, such as `Category:Slayer monsters`. This condition will be `true` if the `page_name` for a row is in the specified category.

---Represents a logical OR of multiple conditions.
---@param ... Condition One or more conditions to combine with OR.
---@return Condition
function bucket.Or(...) end

---Represents a logical AND of multiple conditions.
---@param ... Condition One or more conditions to combine with AND.
---@return Condition
function bucket.And(...) end

---Represents a logical NOT of a condition.
---@param condition Condition The condition to negate.
---@return Condition
function bucket.Not(condition) end

---@class bucketNull
---
---Used as a Value in a Condition, represents nil.
---
---Returned by [`bucket.Null`](lua://bucket.Null).

---Used as Value in a Condition, represents nil.
---
---Note: nil cannot be used directly within bucket.where(), as nil cannot be stored as a table value in lua.
---@return bucketNull
function bucket.Null() end

---@class QueryBuilder
---A builder for constructing bucket queries. This is returned by the [`bucket`](lua://bucket) function.
local QueryBuilder = {}

---Specifies a subobject to write to.
---
---@param sub string The name of the subobject.
---@return QueryBuilder #The QueryBuilder instance which you can call [`QueryBuilder.put`](lua://QueryBuilder.put) on.
function QueryBuilder.sub(sub) end

---Writes a value to the bucket.
---@param value table<string, string | number | boolean | nil> The value to write to the bucket.
function QueryBuilder.put(value) end

---Select one or more fields from the bucket. Each argument can be one of the following:
---
---- A field name in the primary bucket
---- A combined bucket and field specifier, joined together by `.`. Such as `drops_line.page_name_sub`
---- A category, such as `Category:Slayer Monsters`. In this case the returned field will be a Boolean, with true indicating that the page is a member of the specified Category.
---
---Multiple select statements are supported in a query, with `select('one').select('two')` acting identically to `select('one', 'two')`.
---@param ... string
---@return QueryBuilder
function QueryBuilder.select(...) end

---Specify conditions for the query.
---
---Condition should either be a table of the format `{Selector, Operand, Value}` or `{Selector, Value}`, or a string specifying a category, such as `Category:Slayer monsters`.
---
---Operand is one of `=`, `!=`, `>`, `<`, `>=`, `<=`.
---
---Calling `where(Selector, Operand, Value)` or `where(Selector, Value)` is also supported as a shorthand for `where({Selector, Operand, Value})` or `where({Selector, Value})`.
---
---When specifying multiple conditions in one where call, the conditions must be wrapped in `{ }`, such as `where({'page_name', 'Food'}, {'Category:Ingredients'})`.
---
---Supplying multiple conditions is equivalent to `where(Bucket.And(Condition, ...))`.
---
---@param ... Condition One or more conditions.
---@return QueryBuilder
function QueryBuilder.where(...) end

---Join another bucket to the query. This performs an inner join, so only rows with matching values in both buckets will be returned.
---
---Selector can be one of the following:
---- A field name in the primary bucket
---- A combined bucket and field specifier, joined together by `.`. Such as `drops_line.page_name_sub`
---- A category, such as `Category:Slayer Monsters`. In this case the returned field will be a Boolean, with true indicating that the page is a member of the specified Category.
---
---@param bucket string The name of the bucket to join with.
---@param selector1 string The selector for a field to be used as the join key from the joined bucket.
---@param selector2 string The selector for a field to be used as the join key from either the primary bucket (i.e. the bucket specified in the initial call to `bucket()`), or another bucket joined in a previous call to `join()`.
---@return QueryBuilder
function QueryBuilder.join(bucket, selector1, selector2) end

---Limit the number of results returned by the query.
---@param n integer The maximum number of results to return.
---@return QueryBuilder
function QueryBuilder.limit(n) end

---Set the offset for the query, i.e. the number of results to skip before starting to return results.
---@param n integer The offset for the query.
---@return QueryBuilder
function QueryBuilder.offset(n) end

---Set the order for the query results.
---@param selector string The selector for a field to sort by. Must be present in the `bucket.select` call for this query.
---@param order 'asc' | 'desc' The order to sort by. Must be either `asc` or `desc`.
---@return QueryBuilder
function QueryBuilder.orderBy(selector, order) end

---Used for debugging, will log the SQL query to the lua console.
function QueryBuilder.printSQL() end

---Run the query and return the results as a table.
---
---The query result is returned as a lua array, one entry per row returned. Each array element is a table, with one property per argument to select. These properties are all returned exactly as input to select. The property value will be of the data type specified by the Bucket, except in the case of a repeated field, where it will be an array of that data type.
---
---@return table<number, table<string, string | number | boolean | (string | number | boolean | nil)[] | nil>>
function QueryBuilder.run() end

mw.bucket = bucket
mw.ext.bucket = bucket

return bucket
