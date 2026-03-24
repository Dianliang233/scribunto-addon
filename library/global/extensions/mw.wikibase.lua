---@meta mw.wikibase

---@class mw.wikibase.entity
---@field id string The entity id (e.g. "Q42" / "P31").
---@field type string Entity type, e.g. "item" or "property".
---@field schemaVersion number JSON schema version.
---@field labels table<string, {language: string, value: string}> Map of language code to label object.
---@field descriptions table<string, {language: string, value: string}> Map of language code to description object.
---@field aliases table<string, {language: string, value: string}[]> Map of language code to alias list.
---@field sitelinks table<string, {site: string, title: string, badges: string[]}> Sitlink map keyed by site id.
---@field claims table<string, table[]> Claim map keyed by property id.
---@field modified string Timestamp of last change.
---@field lastrevid number Last revision id.

---@class mw.wikibase.entity.claimRanks
---@field RANK_TRUTH string
---@field RANK_PREFERRED string
---@field RANK_NORMAL string
---@field RANK_DEPRECATED string

---Lua API added by [Extension:Wikibase](https://www.mediawiki.org/wiki/Extension:Wikibase).
mw.wikibase = {}

---Get a Wikibase entity for the current page or a specific entity id.
---
---This function is [expensive](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit) when called with the ID of an entity not connected to the current page.
---@param id? string The entity id (e.g. "Q42").
---@return mw.wikibase.entity | nil
function mw.wikibase.getEntity(id) end

---Return the item id connected to the current page, or nil.
---@return string | nil
function mw.wikibase.getEntityIdForCurrentPage() end

---Return the item id for a page title, optionally on another cluster wiki.
---@param pageTitle string The page title.
---@param globalSiteId? string Optional global site id (e.g. "enwiktionary").
---@return string | nil
function mw.wikibase.getEntityIdForTitle(pageTitle, globalSiteId) end

---Return the canonical entity URL for an entity id or current page entity.
---@param id? string
---@return string | nil
function mw.wikibase.getEntityUrl(id) end

---Label in content/user language for a given entity or current page entity.
---
---The label will either be in the wiki's content language (on monolingual wikis) or the user's language (on multilingual wikis), furthermore language fallbacks will be applied.
---@param id? string If not present, the label of the item connected to the current page will be returned, if the page is indeed connected and a label exists.
---@return string | nil
---@see mw.wikibase.getLabelByLang
function mw.wikibase.getLabel(id) end

---Label in content/user language for a given entity or current page entity. In addition to the label, the language used will also be returned.
---
---The label will either be in the wiki's content language (on monolingual wikis) or the user's language (on multilingual wikis), furthermore language fallbacks will be applied.
---@param id? string If not present, the label of the item connected to the current page will be returned, if the page is indeed connected and a label exists.
---@return string | nil, string | nil #Label and language code used for the label.
---@see mw.wikibase.getLabelByLang
function mw.wikibase.getLabelWithLang(id) end

---Label in specific language for a given entity. Does not apply language fallbacks.
---@param id string
---@param languageCode string
---@return string | nil
function mw.wikibase.getLabelByLang(id, languageCode) end

---Description in specific language for a given entity. Does not apply language fallbacks.
---@param id string
---@param languageCode string
---@return string | nil
function mw.wikibase.getDescriptionByLang(id, languageCode) end

---Sitelink for an entity on current wiki or another cluster wiki.
---@param id string
---@param globalSiteId? string Optional global site id.
---@return string | nil
function mw.wikibase.getSitelink(id, globalSiteId) end

---Badges on a sitelink for an entity on current or other site.
---@param id string
---@param globalSiteId? string Optional global site id.
---@return string[]
function mw.wikibase.getBadges(id, globalSiteId) end

---Description in content/user language for a given entity or current page entity.
---
---The description will either be in the wiki's content language (on monolingual wikis) or the user's language (on multilingual wikis), furthermore language fallbacks will be applied.
---@param id? string If not present, the description of the item connected to the current page will be returned, if the page is indeed connected and a description exists.
---@return string | nil
function mw.wikibase.getDescription(id) end

---Label in content/user language for a given entity or current page entity. In addition to the label, the language used will also be returned.
---
---The description will either be in the wiki's content language (on monolingual wikis) or the user's language (on multilingual wikis), furthermore language fallbacks will be applied.
---@param id? string If not present, the description of the item connected to the current page will be returned, if the page is indeed connected and a description exists.
---@return string | nil, string | nil #Description and language code used for the description.
function mw.wikibase.getDescriptionWithLang(id) end

---Check if an entity id is syntactically valid.
---@param entityIdSerialization string
---@return boolean
function mw.wikibase.isValidEntityId(entityIdSerialization) end

---Check if an entity exists. Redirected entities are reported as existing too.
---@param id string
---@return boolean
function mw.wikibase.entityExists(id) end

---Render a snak to wikitext escaped plain text. This is useful for displaying References or Qualifiers.
---@param snak table
---@return string
function mw.wikibase.renderSnak(snak) end

---Format a snak to rich wikitext. This is useful for displaying References or Qualifiers.
---@param snak table
---@return string
function mw.wikibase.formatValue(snak) end

---Render a list of snaks to wikitext escaped plain text. This is useful for displaying References or Qualifiers.
---@param snaks table
---@return string
function mw.wikibase.renderSnaks(snaks) end

---Format a list of snaks to rich wikitext. This is useful for displaying References or Qualifiers.
---@param snaks table
---@return string
function mw.wikibase.formatValues(snaks) end

---Resolve property id by label or id. This allows using the property's labels instead of ids in all places. If no property was found for the label, a nil value is returned.
---@param propertyLabelOrId string
---@return string | nil I
function mw.wikibase.resolvePropertyId(propertyLabelOrId) end

---Get property order from MediaWiki:Wikibase-SortedProperties. If the page does not exist, a nil value is returned.
---@return table<string, number> | nil
function mw.wikibase.getPropertyOrder() end

---Order a list of property IDs by Wikibase property order.
---@param propertyIds string[]
---@return string[]
function mw.wikibase.orderProperties(propertyIds) end

---Get best statements (`preferred` or `normal`) for entity + property.
---
---The definition of "best" is that the function will return "preferred" statements, if there are any, otherwise "normal" ranked statements. It will never return "deprecated" statements. This is what you usually want when surfacing values to an ordinary reader.
---@param entityId string
---@param propertyId string
---@return table[]
function mw.wikibase.getBestStatements(entityId, propertyId) end

---Get all statements (including deprecated) for entity + property.
---@param entityId string
---@param propertyId string
---@return table[]
function mw.wikibase.getAllStatements(entityId, propertyId) end

---Get one referenced entity id out of a candidate set. The starting entity, and the target entities are (potentially indirectly, via intermediate entities) linked by statements with the given property ID, pointing from the starting entity to one of the target entities.
---
---@param fromEntityId string
---@param propertyId string
---@param toIds string[]
---@return string | nil | false #Returns nil if none of the given entities is referenced. Returns false if the search for a referenced entity had to be aborted due to resource limits or errors, thus the result is inconclusive.
function mw.wikibase.getReferencedEntityId(fromEntityId, propertyId, toIds) end

---Return the global site id of the current wiki.
---@return string
function mw.wikibase.getGlobalSiteId() end

--aliases
mw.wikibase.getEntityObject = mw.wikibase.getEntity
mw.wikibase.label = mw.wikibase.getLabel
mw.wikibase.description = mw.wikibase.getDescription
mw.wikibase.sitelink = mw.wikibase.getSitelink

---Wikibase entity instance methods.
mw.wikibase.entity = {}

---Get entity ID.
---@return string
function mw.wikibase.entity:getId() end

---Get entity label with optional language.
---@param langCode? string
---@return string | nil
function mw.wikibase.entity:getLabel(langCode) end

---Get entity description with optional language.
---@param langCode? string
---@return string | nil
function mw.wikibase.entity:getDescription(langCode) end

---Get entity label with language.
---@param langCode? string
---@return string | nil, string | nil
function mw.wikibase.entity:getLabelWithLang(langCode) end

---Get entity description with language.
---@param langCode? string
---@return string | nil, string | nil
function mw.wikibase.entity:getDescriptionWithLang(langCode) end

---Get entity sitelink on current or given site.
---@param globalSiteId? string
---@return string | nil
function mw.wikibase.entity:getSitelink(globalSiteId) end

---Get all property ids used in this entity.
---
---This adds a statement usage for all statements present, therefore it should only be used if absolutely necessary.
---@return string[]
function mw.wikibase.entity:getProperties() end

---Get best statements in this entity. This includes all statements with rank "preferred" or, if no preferred ones exist, all statements with rank "normal". Statements with rank "deprecated" are never included.
---@param propertyLabelOrId string
---@return table[]
function mw.wikibase.entity:getBestStatements(propertyLabelOrId) end

---Get all statements in this entity.
---@param propertyLabelOrId string
---@return table[]
function mw.wikibase.entity:getAllStatements(propertyLabelOrId) end

---Format property values as plain wikitext escaped text.
---@param propertyLabelOrId string
---@param acceptableRanks? mw.wikibase.entity.claimRanks
---@return table | nil
function mw.wikibase.entity:formatPropertyValues(propertyLabelOrId, acceptableRanks) end

---Format property statements as rich wikitext.
---@param propertyLabelOrId string
---@param acceptableRanks? mw.wikibase.entity.claimRanks
---@return table | nil
function mw.wikibase.entity:formatStatements(propertyLabelOrId, acceptableRanks) end

return mw.wikibase
