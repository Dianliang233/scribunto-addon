---@meta frame

---@class frame
---The frame object is the interface to the parameters passed to `{{#invoke:}}`, and to the parser.
---Note that there is no frame library, and there is no global variable named frame. A frame object is typically obtained by being passed as a parameter to the function called by `{{#invoke:}}`, and can also be obtained from [mw.getCurrentFrame()](lua://mw.getCurrentFrame).
local frame = {}

---A table for accessing the arguments passed to the frame. For example, if a module is called from wikitext with:
---```wikitext
---{{#invoke:module|function|arg1|arg2|name=arg3}}
---```
---then `frame.args[1]` will return `"arg1"`, `frame.args[2]` will return "`arg2"`, and `frame.args['name']` (or `frame.args.name`) will return "arg3". It is also possible to iterate over arguments using `pairs(frame.args)` or `ipairs(frame.args)`. However, due to how Lua implements table iterators, iterating over arguments will return them in an unspecified order, and there's no way to know the original order as they appear in wikitext.
---
---As in MediaWiki template invocations, named arguments will have leading and trailing whitespace removed from both the name and the value before they are passed to Lua, whereas unnamed arguments will not have whitespace stripped.
---
---For performance reasons, `frame.args` uses a metatable, rather than directly containing the arguments. Argument values are requested from MediaWiki on demand. This means that most other table methods will not work correctly, including `#frame.args`, [`next(frame.args)`](lua://next), and the functions in the [Table library](lua://table).
---
---If preprocessor syntax such as template invocations and triple-brace arguments are included within an argument to `#invoke`, they will not be expanded, after being passed to Lua, until their values are being requested in Lua. If certain special tags written in XML notation, such as `<pre>`, `<nowiki>`, `<gallery>` and `<ref>`, are included as arguments to #invoke, then these tags will be converted to "[strip markers](https://www.mediawiki.org/wiki/Strip_marker)" — special strings which begin with a delete character (ASCII 127), to be replaced with HTML after they are returned from #invoke.
---@type table<number | string, string>
frame.arg = {}

---Call a parser function, returning an appropriate string. This is preferable to [frame:preprocess](lua://frame.preprocess), but whenever possible, native Lua functions or Scribunto library functions should be preferred to this interface.
---
---Note that the function name and arguments are not preprocessed before being passed to the parser function.
---
---@param name string
---@param args table<number | string, number | string>
---@return string #The expanded wikitext.
function frame:callParserFunction(name, args) end

---Call a parser function, returning an appropriate string. This is preferable to [frame:preprocess](lua://frame.preprocess), frame whenever possible, native Lua functions or Scribunto library functions should be preferred to this interface.
---
---Note that the function name and arguments are not preprocessed before being passed to the parser function.
---
---@param name string
---@param ... number | string
---@return string #The expanded wikitext.
function frame:callParserFunction(name, ...) end

---Call a parser function, returning an appropriate string. This is preferable to [frame:preprocess](lua://frame.preprocess), but whenever possible, native Lua functions or Scribunto library functions should be preferred to this interface.
---
---Note that the function name and arguments are not preprocessed before being passed to the parser function.
---
---@param namedArg {name: string, args: table<number | string, number | string>}
---@return string #The expanded wikitext.
function frame:callParserFunction(namedArg) end

---Expands the given wikitext. This is equivalent to a call to [frame:callParserFunction()](frame:callParserFunction) with function name 'msg' (see [Help:Magic words#Transclusion modifiers](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Magic_words#Transclusion_modifiers)) and with title prepended to args.
---
---As in transclusion, if the passed title does not contain a namespace prefix it will be assumed to be in the Template: namespace.
---
---Note that the title and arguments are not preprocessed before being passed into the template.
---
---@param namedArg {title: string, args: table<number | string, number | string>}
---@return string #The expanded wikitext.
function frame:expandTemplate(namedArg) end

---Expands an extension tag. This is equivalent to a call to [frame:callParserFunction()](frame:callParserFunction) with function name '#tag' (see [Help:Magic words#Miscellaneous](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Magic_words#Miscellaneous)) and with name and content prepended to args.
---
---Note that the title and arguments are not preprocessed before being passed into the template.
---
---@param name string
---@param content string
---@param args table<number | string, number | string> | string
---@return string #The expanded wikitext.
function frame:extensionTag(name, content, args) end

---Expands an extension tag. This is equivalent to a call to [frame:callParserFunction()](frame:callParserFunction) with function name '#tag' (see [Help:Magic words#Miscellaneous](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Magic_words#Miscellaneous)) and with name and content prepended to args.
---
---Note that the title and arguments are not preprocessed before being passed into the template.
---
---@param namedArg {name: string, content: string, args: table<number | string, number | string> | string}
function frame:extensionTag(namedArg) end

---Get the parent frame.
---
---For instance, if the template `{{Example}}` contains the code `{{#invoke:ModuleName|FunctionName|A|B}}`, and a page transcludes that template with the code `{{Example|C|D}}`, then in *Module:ModuleName*, calling `frame.args[1]` and `frame.args[2]` returns `"A"` and `"B"`, and calling `frame:getParent().args[1]` and `frame:getParent().args[2]` returns `"C"` and `"D"`, with frame being the first argument in the function call.
---
---@return frame | nil #The parent frame, or nil if there is no parent frame.
function frame:getParent() end

---Get the title associated with the frame. For the frame created by {{#invoke:}}, this is the title of the module invoked.
---
---@return string #The title of the frame.
function frame:getTitle() end

---Create a new [Frame object](lua://frame) that is a child of the current frame, with optional arguments and title.
---
---This is mainly intended for use in modules that call other modules whose name is defined by the caller (e.g. `{{#invoke:params|concat_and_invoke}}`), or in the debug console for testing functions that would normally be called by `{{#invoke:}}`. The number of frames that may be created at any one time is limited.
---
---@param namedArg { title: string, args: table<number | string, number | string> }
---@return frame #The new frame object.
function frame:newChild(namedArg) end

---Expands wikitext in the context of the frame, i.e. templates, parser functions, and parameters such as `{{{1}}}` are expanded, and returns the expanded text. If certain special tags written in XML notation, such as `<pre>`, `<nowiki>`, `<gallery>` and `<ref>`, are included as arguments to #invoke, then these tags will be converted to "[strip markers](https://www.mediawiki.org/wiki/Strip_marker)" — special strings which begin with a delete character (ASCII 127), to be replaced with HTML after they are returned from #invoke.
---
---If you are expanding a single template, use [frame:expandTemplate](lua://frame.expandTemplate) instead of trying to construct a wikitext string to pass to this method. It's faster and less prone to error if the arguments contain pipe characters or other wikimarkup.
---
---If you are expanding a single parser function, use [frame:callParserFunction](lua://frame.callParserFunction) for the same reasons.
---
---@param string string
function frame:preprocess(string) end

---Expands wikitext in the context of the frame, i.e. templates, parser functions, and parameters such as `{{{1}}}` are expanded, and returns the expanded text. If certain special tags written in XML notation, such as `<pre>`, `<nowiki>`, `<gallery>` and `<ref>`, are included as arguments to #invoke, then these tags will be converted to "[strip markers](https://www.mediawiki.org/wiki/Strip_marker)" — special strings which begin with a delete character (ASCII 127), to be replaced with HTML after they are returned from #invoke.
---
---If you are expanding a single template, use [frame:expandTemplate](lua://frame.expandTemplate) instead of trying to construct a wikitext string to pass to this method. It's faster and less prone to error if the arguments contain pipe characters or other wikimarkup.
---
---If you are expanding a single parser function, use [frame:callParserFunction](lua://frame.callParserFunction) for the same reasons.
---
---@param namedArg { text: string }
function frame:preprocess(namedArg) end

---@class parserValue
---@field expand fun(): string

---Creates a new parser value object.
---@param text string The text to be parsed.
---@return parserValue #An object with a method `expand` that returns the result of [`frame:preprocess`](lua://frame.preprocess) with the arguments.
function frame:newParserValue(text) end

---Creates a new parser value object.
---@param namedArg { text: string } The text to be parsed.
---@return parserValue #An object with a method `expand` that returns the result of [`frame:preprocess`](lua://frame.preprocess) with the arguments.
function frame:newParserValue(namedArg) end

---Creates a new template parser value object.
---@param namedArg { title: string, args: table<number | string, number | string> }
---@return parserValue #An object with a method `expand` that returns the result of [`frame:expandTemplate`](lua://frame.expandTemplate) with the arguments.
function frame:newTemplateParserValue(namedArg) end

---Same as pairs(frame.args). Included for backwards compatibility.
---@return fun(table: table<string | number, string>, index?: string | number): string | number, string #The iterator function.
function frame:argumentPairs() end

-- no export
