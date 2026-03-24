---@meta mw.ext.FlaggedRevs

---Lua API added by [Extension:FlaggedRevs](https://www.mediawiki.org/wiki/Extension:FlaggedRevs).
mw.ext.FlaggedRevs = {}

---Retrieves the stability settings for a given page.
---@param title string | MwTitle page to get stability settings from
---@return {override: number, autoreview: string, expiry: string }
function mw.ext.FlaggedRevs.getStabilitySettings(title) end

return mw.ext.FlaggedRevs
