---@meta mw.ext.TemplateStyles

---Lua API added by [Extension:TemplateStyles](https://www.mediawiki.org/wiki/Extension:TemplateStyles).
---@see mw.ext.TemplateStyles.link
mw.ext.TemplateStyles = {}

---Generates a <templatestyles> extension tag pointing to the given page.
---
---Note that this function has no side effects and does not actually load the styles from the page. You must ensure its output is included in the final return value of the module.
---@param page string The sanitized CSS page to link to.
---@return string #A <templatestyles> extension tag pointing to the page.
function mw.ext.TemplateStyles.link(page) end

return mw.ext.TemplateStyles
