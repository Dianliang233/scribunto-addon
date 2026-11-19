---@meta mw.ext.GloopTweaks

---Lua API added by [Extension:GloopTweaks](https://github.com/weirdgloop/mediawiki-extensions-GloopTweaks).
---@see mw.ext.GloopTweaks.filepath
mw.ext.GloopTweaks = {}

---Returns the direct link to an uploaded file.
---
---This function is [expensive](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit).
---@param name string The name of the file to link to.
---@param width? number The width of the image. If specified, the link will point to a thumbnail.
---@return string #The direct link to the file, or a thumbnail if width is specified.
function mw.ext.GloopTweaks.filepath(name, width) end

return mw.ext.GloopTweaks
