---@meta mw.ext.TitleBlacklist

---@class mw.ext.TitleBlacklist
---@see mw.ext.TitleBlacklist.test
---
---Lua API added by [Extension:TitleBlacklist](https://www.mediawiki.org/wiki/Extension:TitleBlacklist).
mw.ext.TitleBlacklist = {}

---@class TitleBlacklistEntry
---@field params TitleBlackListEntryParams Parameters for the matched entry.
---@field regex boolean Regular expression matched for the given title.
---@field raw string Raw blacklist entry.
---@field version integer Version number of the result.
---@field message string Message to display to the user.
---@field custommessage? string Custom message for this entry.

---@class TitleBlackListEntryParams
---@field autoconfirmed? boolean Allows autoconfirmed users to perform such actions.
---@field casesensitive? boolean Do not ignore case when checking title for being blacklisted.
---@field noedit? boolean Forbid editing the page (if it already exists).
---@field moveonly? boolean Forbid moves but allow ordinary creation.
---@field newaccountonly? boolean Forbid creation of matching usernames, but allow page creation.
---@field reupload? boolean Allow reuploads of existing blacklisted files.
---@field errmsg? string The name of the message that should be displayed instead of the default
---@field antispoof? boolean Check for similar usernames. Extension:AntiSpoof must be installed.

---Tests if particular titles and actions will match an entry in the blacklist. If a match is found, the details for the matched entry are returned.
---@param action 'create' | 'createpage' | 'createtalk' | 'edit' | 'move' | 'new-account' | 'upload' Action to test.
---@param title string Title to test.
---@return TitleBlacklistEntry | nil #Details for the matched entry, or nil if no match is found.
function mw.ext.TitleBlacklist.test(action, title) end

-- no export
