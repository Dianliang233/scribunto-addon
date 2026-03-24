---@meta mw.ext.translate

---Lua API added by [Extension:Translate](https://www.mediawiki.org/wiki/Extension:Translate).
---@see mw.ext.translate.messageBundle
mw.ext.translate = {}

mw.ext.translate.messageBundle = {}

---@class MessageBundle
local MessageBundle = {}

--- Loads all the messages in a table format with the key being the key in the message bundle value being the string
--- @return table #A table containing all translations.
function MessageBundle:getAllTranslations() end

---Loads the translation for a given key, with the specified params
---@param key string Key in message bundle for which to retrieve the translation
---@return MwMessage #The translation for the given key wrapped in mw.message object
function MessageBundle:t(key) end

---Returns a table to access translations loaded with fallbacks from the requested message bundle
---@param title string | table Message bundle page name
---@param languageCode? string Language to load the translations in, defaults to page language code
---@return table A new translate message bundle table
function mw.ext.translate.messageBundle.new(title, languageCode) end

---Returns a table to access translations without fallbacks from the requested message bundle
---@param title string | table Message bundle page name
---@param languageCode? string Language to load the translations in, defaults to page language code
---@return table #A new translate message bundle table loaded without access to fallbacks
function mw.ext.translate.messageBundle.newWithoutFallbacks(title, languageCode) end

return mw.ext.translate.messageBundle
