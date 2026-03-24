---@meta mw.ext.proofreadPage

---@class mw.ext.proofreadPage
---@field NS_INDEX number the current Index namespace number
---@field NS_PAGE number the current Index talk namespace number
---
---Lua API added by [Extension:ProofreadPage](https://www.mediawiki.org/wiki/Extension:ProofreadPage).
mw.ext.proofreadPage = {}

---@class QualityLevel
---Dummy object representing quality level constant

---@class mw.ext.proofreadPage.QualityLevel
---
---Quality level constants
---
---@field WITHOUT_TEXT QualityLevel
---@field NOT_PROOFREAD QualityLevel
---@field PROBLEMATIC QualityLevel
---@field PROOFREAD QualityLevel
---@field VALIDATED QualityLevel

---@class ProofreadPageIndex
---@field title MwTitle The title of the page.
---@field pageCount number The number of pages in the index. [This might be  expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
---@field existingPages number The number of pages in the index that currently exist. [This might be expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
---@field missingPages number The number of pages in the index that currently do not exist. [This might be expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
---@field categories MwTitle[] Get a list of the categories the index page specifies. [This might be expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
---@field fields table A table of the fields that the index page has set. [This might be expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
local ProofreadPageIndex = {}

---Access a given index.
---
---@param index string | MwTitle the index to access
---@return ProofreadPageIndex
function mw.ext.proofreadPage.newIndex(index) end

---Get the n'th Page of the index.
---
---This function is [expensive](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit) if the page hasn't been looked up before.
---@param n number The page number to get, starting from 1
---@return ProofreadPagePage
function ProofreadPageIndex:getPage(n) end

---Get the number of pages in the index that currently have the given level.
---
---This function is [expensive](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit) if the progress stats are not cached.
---
---@param level QualityLevel The quality level to count
---@return number
function ProofreadPageIndex:pagesWithLevel(level) end

---@class ProofreadPagePage
---@field title MwTitle The title of the page.
---@field index ProofreadPageIndex The index this page belongs to. [This might be expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field quality QualityLevel The quality level of the page. [This might be expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field position number The position of the page in the index pagelist, starting at 1. [This might be expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field displayedNumber number The displayed page number of the page. [This might be expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field rawNumber number The raw page number of the page. [This might be expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field nextPage ProofreadPagePage The next page in the index. [This might be expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field previousPage ProofreadPagePage The previous page in the index. [This might be expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
local ProofreadPagePage = {}

---Access a given page.
---
---@param page string | MwTitle
---@return ProofreadPagePage
function mw.ext.proofreadPage.newPage(page) end

---Get the page at the given offset (e.g. 1 is the next page) in the index page list.
---
---This function is [expensive](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit) if the page at the offset hasn't been looked up before.
---
---@param offset number The offset to get the page at, e.g. 1 is the next page, -1 is the previous page.
---@return ProofreadPagePage
function ProofreadPagePage:withOffset(offset) end

return mw.ext.proofreadPage
