---@meta mw.ext.ParserFunctions

---@class mw.ext.ParserFunctions
---@see mw.ext.ParserFunctions.expr
---
---Lua API added by [Extension:ParserFunctions](https://www.mediawiki.org/wiki/Extension:ParserFunctions).
mw.ext.ParserFunctions = {}

---Evaluates an ParserFunctions #expr expression.
---@param expr string Expression to evaluate. See [syntax information](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Expr_parser_function_syntax).
---@return string #The result of the expression.
function mw.ext.ParserFunctions.expr(expr) end

-- no export
