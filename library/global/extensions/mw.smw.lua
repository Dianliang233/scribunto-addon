---@meta mw.smw

---@class mw.smw
---
---Lua API added by [Semantic Scribunto](https://www.mediawiki.org/wiki/Extension:Semantic_Scribunto), providing native Scribunto support for the [Semantic MediaWiki](https://www.semantic-mediawiki.org/wiki/Semantic_MediaWiki) extension.
mw.smw = {}

---Adds a #info bubble to the page.
---
---@param text string Text in the #info bubble and should only contain inline HTML elements. There is limited support for wikitext formatting such as bold, italics and internal links. No paragraphs, tables, lists or any other block elements are allowed.
---@param icon 'info' | 'note' | 'warning' | 'error' Icon to be displayed in the #info bubble.
function mw.smw.info(text, icon) end

---@alias SMWValue string | number | boolean | nil

---Assign a value to a Semantic MediaWiki property.
---@param param string | string[] | table<number | string, SMWValue | SMWValue[]>
function mw.smw.set(param) end

---Assign a value to a Semantic MediaWiki subobject.
---@param param string | string[] | table<number | string, SMWValue | SMWValue[]>
---@param id? string A subobject ID.
function mw.smw.subobject(param, id) end

---@class SMWQueryParams
---@field limit? integer The maximum number of results to return.
---@field offset? integer The number of results to skip.
---@field sort? string | string[] Property name or a list of property names separated by `,`.
---@field order? 'ascending' | 'asc' | 'descending' | 'desc' | 'reverse' | 'random' | 'rand' The sort order. Defaults to `ascending`.
---@field mainlabel? string Title of the first column (the one with the page titles in it), default is no title; set to - to suppress printing the page titles.
---@field index? integer Defines which value within a record should be displayed, only applicable for properties of type [Record](https://www.semantic-mediawiki.org/wiki/Help:Type_Record)

---Request semantic information from the wiki.
---
---@see mw.smw.getQueryResult Compare output format.
---@param query string | string[] | SMWQueryParams
---@return table<number, table<string, SMWValue | SMWValue[]>>
function mw.smw.ask(query) end

---@class SMWGetQueryResultReturn
---@field meta { count: integer, hash: string, offset: integer, source: string, time: string }
---@field printrequests table<number, { format: string, key: string, label: string, label: integer, redi: string, typeid: string }>
---@field results table<number, { displaytitle: string, exists: string, fulltext: string, fullurl: string, namespace: integer, printouts: any }>
---@field serializer string
---@field version integer

---Request semantic information from the wiki.
---
---@see mw.smw.ask Compare output format.
---@param query string | string[] | SMWQueryParams
---@return SMWGetQueryResultReturn
function mw.smw.getQueryResult(query) end

---Get the type of a Semantic MediaWiki property.
---
---@param property string The property name.
---@return string | '_anu' | '_boo' | '_cod' | '_dat' | '_eid' | '_ema' | '_geo' | '_keyw' | '_mlt_rec' | '_num' | '_qty' | '_rec' | '_ref_rec' | '_tel' | '_tem' | '_txt' | '_uri' | '_wpg' | nil #The property type, or nil if the property does not exist. See [documentation](https://www.semantic-mediawiki.org/wiki/Help:List_of_datatypes) for information about the internal type names.
function mw.smw.getPropertyType(property) end

-- no export
