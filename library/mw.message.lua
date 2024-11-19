---@meta mw.message

---@class mw.message
---Interface to the localization messages and the MediaWiki: namespace.
mw.message = {}

---@class valuemt
---Internal interface for special values returned by [mw.message.numParam()](lua://mw.message.numParam) or [mw.message.rawParam()](lua://mw.message.rawParam).

---@alias messageParam number | string | valuemt

---Creates a new message object for the given message key.
---@param key string The message key.
---@param ... messageParam Additional parameters passed to the new object's params() method.
---@return mw.message #The new message object.
function mw.message.new(key, ...) end

---Creates a new message object for the given messages. The first one that exists will be used.
---@param ... string The message keys.
---@return mw.message #The new message object.
function mw.message.newFallbackSequence(...) end

---Creates a new message object, using the given text directly rather than looking up an internationalized message.
---@param msg string The raw message text.
---@param ... messageParam Additional parameters passed to the new object's params() method.
---@return mw.message #The new message object.
function mw.message.newRawMessage(msg, ...) end

---Wraps the value so that it will not be parsed as wikitext by msg:parse().
---@param value messageParam The value to wrap.
---@return valuemt #The wrapped value.
function mw.message.rawParam(value) end

---Wraps the value so that it will automatically be formatted as by lang:formatNum().
---@param value number The value to wrap.
---@return valuemt #The wrapped value.
function mw.message.numParam(value) end

---Returns a Language object for the default language.
---@return mw.language #The default language object.
function mw.message.getDefaultLanguage() end

---Adds parameters to the message.
---
---If a sequence table is used, parameters must be directly present in the table; references using the __index metamethod will not work.
---
---@param ... messageParam The parameters to add.
---@return mw.message #The message object.
---@overload fun(table: messageParam[]): mw.message
function mw.message:params(...) end

---Adds parameters to the message, passing them through [mw.message.rawParam()](lua://mw.message.rawParam) first.
---
---@param ... messageParam The parameters to add.
---@return mw.message #The message object.
---@overload fun(table: messageParam[]): mw.message
function mw.message:rawParams(...) end

---Adds parameters to the message, passing them through [mw.message.numParam()](lua://mw.message.numParam) first.
---
---@param ... number The parameters to add.
---@return mw.message #The message object.
---@overload fun(table: number[]): mw.message
function mw.message:numParams(...) end

---Specifies the language to use when processing the message.
---
---The default language is the one returned by mw.message.getDefaultLanguage().
---
---@param lang string | { getCode: function } | nil The language to use.
---@return mw.message #The message object.
function mw.message:inLanguage(lang) end

---Specifies whether to look up messages in the MediaWiki: namespace (i.e. look in the database), or just use the default messages distributed with MediaWiki.
---
---Defaults to true.
---
---@param useDb boolean  Whether to use the database for message lookup.
---@return mw.message #The message object.
function mw.message:useDatabase(useDb) end

---Substitutes the parameters and returns the message wikitext as-is. Template calls and parser functions are intact.
---@return string #The message wikitext.
function mw.message:plain() end

---Returns a boolean indicating whether the message key exists.
---@return boolean #True if the message key exists, false otherwise.
function mw.message:exists() end

---Returns a boolean indicating whether the message key has content. Returns true if the message key does not exist or the message is the empty string.
---@return boolean #True if the message key has content, false otherwise.
function mw.message:isBlank() end

---Returns a boolean indicating whether the message key is disabled. Returns true if the message key does not exist or if the message is the empty string or the string "-".
---@return boolean #True if the message key is disabled, false otherwise.
function mw.message:isDisabled() end

-- no export
