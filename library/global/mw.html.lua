---@meta mw.html

---Interface for building complex HTML from Lua.
---
---Create an mw.html object using [`mw.html.create()`](lua://mw.html.create).
mw.html = {}

---@class MwHtml
local MwHtml = {}

---@class MwHtmlOptions
---@field selfClosing boolean #Force the current tag to be self-closing, even if mw.html doesn't recognize it as self-closing.
---@field parent MwHtml Parent of the current mw.html instance (intended for internal usage)

---Create an mw.html object.
---
---@param tagName? string The tag name for the element. And empty string or nil creates an mw.html object with no enclosing tag.
---@param args? MwHtmlOptions Additional options for the element.
---@return MwHtml #The mw.html object.
function mw.html.create(tagName, args) end

---Appends a child mw.html (builder) node to the current mw.html instance.
---@param builder string | MwHtml | nil Either an mw.html instance or a string representation of an HTML element. If a nil parameter is passed, this is a no-op.
---@return MwHtml
function MwHtml:node(builder) end

--- Appends an undetermined number of wikitext strings to the mw.html object.
---
--- Note that this stops at the first nil item.
---
--- Basic wikitext will get parsed, like HTML, links, bold, lists or tables. However, templates and parser functions won't be evaluated if they are passed directly to this function, unless they came from template parameters. Those will be rendered in plain text instead. To evaluate them, they'll have to be passed through [frame:preprocess](lua://frame.preprocess).
---
--- @param ... string | number | nil
--- @return MwHtml
function MwHtml:wikitext(...) end

---Appends a newline to the mw.html object. Useful when used before and after [MwHtml:wikitext()](lua://mw.html.wikitext), when the wikitext contains lists or tables, whose syntax only has a special meaning when present at the start of a line.
--- @return MwHtml
function MwHtml:newline() end

---Appends a new child node with the given tagName to the builder, and returns a mw.html instance representing that new node. The args parameter is identical to that of [mw.html.create](lua://mw.html.create).
---
---Note that contrarily to other methods such as [`html:node()`](lua://mw.html.node), this method doesn't return the current mw.html instance, but the mw.html instance of the newly inserted tag. Make sure to use [`html:done()`](lua://mw.html.done) to go up to the parent mw.html instance, or [`html:allDone()`](lua://mw.html.allDone) if you have nested tags on several levels.
---
---@param tagName? string The tag name for the element.
---@param args? MwHtmlOptions Additional options for the element.
---@return MwHtml #The mw.html object.
function MwHtml:tag(tagName, args) end

---Set an HTML attribute with the given name and value on the node.
---@param name string The name of the attribute to set.
---@param value string | number | nil The value of the attribute to set. A value of nil causes any attribute with the given name to be unset if it was previously set.
---@return MwHtml #The mw.html object.
function MwHtml:attr(name, value) end

---Set an HTML attribute with the given name and value on the node.
---@param table table<string, string | number> A table holding name->value pairs of attributes to set.
---@return MwHtml #The mw.html object.
function MwHtml:attr(table) end

---Get the value of a html attribute previously set using [`html:attr()`](lua://mw.html.attr) with the given `name`.
---@param name string The name of the attribute to get.
---@return string | nil #The value of the attribute, or nil if the attribute is not set.
function MwHtml:getAttr(name) end

---Adds a class name to the node's class attribute.
---@param class string | number | nil Class name to add to the node. If a nil parameter is passed, this is a no-op.
---@return MwHtml #The mw.html object.
function MwHtml:addClass(class) end

---Set an CSS property with the given name and value on the node.
---@param name string The name of the attribute to set.
---@param value string | number | nil The value of the attribute to set. A value of nil causes any property with the given name to be unset if it was previously set.
---@return MwHtml #The mw.html object.
function MwHtml:css(name, value) end

---Set an CSS property with the given name and value on the node.
---@param table table<string, string | number> A table holding name->value pairs of property to set.
---@return MwHtml #The mw.html object.
function MwHtml:css(table) end

---Add some raw css to the node's style attribute.
---@param css string | number | nil The css to add to the node's style attribute. If a nil parameter is passed, this is a no-op.
---@return MwHtml #The mw.html object.
function MwHtml:cssText(css) end

---Returns the parent node under which the current node was created. Like jQuery.end, this is a convenience function to allow the construction of several child nodes to be chained together into a single statement.
---@return MwHtml #The parent mw.html object.
function MwHtml:done() end

---Like [html:done()](lua://mw.html.done), but traverses all the way to the root node of the tree and returns it.
---@return MwHtml #The root mw.html object.
function MwHtml:allDone() end

return mw.html
