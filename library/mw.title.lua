---@meta mw.title

---@class FileMetadata
---@field exists boolean Whether the file exists. It will be recorded as an image usage. If this is false, all other file properties will be nil.
---@field width number The width of the file. If the file contains multiple pages, this is the width of the first page.
---@field height number The height of the file. If the file contains multiple pages, this is the height of the first page.
---@field pages {width: number, height: number}[] | nil If the file format supports multiple pages, this is a table containing tables for each page of the file; otherwise, it is nil. The # operator can be used to get the number of pages in the file. Each individual page table contains a width and height property.
---@field size number The size of the file in bytes.
---@field mimeType string The [MIME type](https://en.wikipedia.org/wiki/MIME_type) of the file.
---@field length number The length (duration) of the media file in seconds. Zero for media types which do not support length.


---@class mw.title
---@field id number The page_id. `0` if the page does not exist. [This may be expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
---@field interwiki string The interwiki prefix, or the empty string if none.
---@field namespace number The namespace number.
---@field fragment string The fragment (aka section/anchor linking), or the empty string. May be assigned.
---@field nsText string The text of the namespace for the page.
---@field subjectNsText string The text of the subject namespace for the page.
---@field talkNsText string The text of the talk namespace for the page, or nil if this title cannot have a talk page.
---@field text string The title of the page, without the namespace or interwiki prefixes.
---@field prefixedText string The title of the page, with the namespace and interwiki prefixes.
---@field fullText string The title of the page, with the namespace and interwiki prefixes and the fragment. Interwiki is not returned if equal to the current.
---@field rootText string If this is a subpage, the title of the root page without prefixes. Otherwise, the same as title.text.
---@field baseText string If this is a subpage, the title of the page it is a subpage of without prefixes. Otherwise, the same as title.text.
---@field subpageText string If this is a subpage, just the subpage name. Otherwise, the same as title.text.
---@field canTalk boolean Whether the page for this title could have a talk page.
---@field exists boolean Whether the page exists. Alias for file.exists for Media-namespace titles. For File-namespace titles this checks the existence of the file description page, not the file itself. [This may be expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
---@field file FileMetadata | { exists: false } Title objects representing a page in the File or Media namespace will have a property called file. [This is expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field fileExists boolean Whether the file exists. It will be recorded as an image usage. The fileExists property on a Title object exists for backwards compatibility reasons and is an alias for [file.exists](lua://FileMetadata).
---@field isContentPage boolean Whether this title is in a content namespace.
---@field isExternal boolean Whether this title has an interwiki prefix.
---@field isLocal boolean Whether this title is in this project. For example, on the English Wikipedia, any other Wikipedia is considered "local" while Wiktionary and such are not.
---@field isRedirect boolean Whether this is the title for a page that is a redirect. [This may be expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
---@field isSpecialPage boolean Whether this is the title for a possible special page (i.e. a page in the Special: namespace).
---@field isSubpage boolean Whether this title is a subpage of some other title.
---@field isTalkPage boolean Whether this is a title for a talk page.
---@field contentModel string The content model for this title, as a string. [This may be expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
---@field basePageTitle mw.title The same as mw.title.makeTitle(title.namespace, title.baseText).
---@field rootPageTitle mw.title The same as mw.title.makeTitle(title.namespace, title.rootText).
---@field talkPageTitle mw.title | nil The same as mw.title.makeTitle(mw.site.namespaces[title.namespace].talk.id, title.text), or nil if this title cannot have a talk page.
---@field subjectPageTitle mw.title The same as mw.title.makeTitle(mw.site.namespaces[title.namespace].subject.id, title.text).
---@field redirectTarget mw.title | false Returns a title object of the target of the redirect page if the page is a redirect and the page exists, returns false otherwise.
---@field protectionLevels table<string, (string | nil)[]> The page's protection levels. This is a table with keys corresponding to each action (e.g., "edit" and "move"). The table values are arrays, the first item of which is a string containing the protection level. If the page is unprotected, either the table values or the array items will be nil. [This is expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field cascadingProtection { restrictions: (string | nil)[], sources: string[] } The cascading protections applicable to the page. This is a table with keys "restrictions" (itself a table with keys like protectionLevels has) and "sources" (an array listing titles where the protections cascade from). If no protections cascade to the page, "restrictions" and "sources" will be empty. [This is expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field categories string[] The list of categories used on the page. [This is expensive.](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit)
---@field content string | nil Returns the (unparsed) content of the page, or nil if there is no page. The page will be recorded as a transclusion.
---@field pageLang mw.language The language object for the title's page content language, which defaults to the wiki's content language. [This is expensive.](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Expensive_properties)
---
---Title utilities and access to page information.
---
---Note that fields ending with text return titles as string values whereas the fields ending with title return title objects.
---
---Note that accessing any expensive field on a title object records a "link" to the page (as shown on Special:WhatLinksHere, for example). Using the title object's getContent() method or accessing the redirectTarget field records it as file or fileExists fields records it as a "file link".
mw.title = {}

---Test for whether two titles are equal. Note that fragments are ignored in the comparison.
---@param a mw.title The first title to compare.
---@param b mw.title The second title to compare.
function mw.title.equals(a, b) end

---Compares titles by interwiki prefix (if any) as strings, then by namespace number, then by the unprefixed title text as a string. These string comparisons use Lua's standard < operator.
---@param a mw.title The first title to compare.
---@param b mw.title The second title to compare.
---@return number Returns -1 if a < b, 0 if a == b, 1 if a > b.
function mw.title.compare(a, b) end

---Returns the title object for the current page.
---@return mw.title The title object for the current page.
function mw.title.getCurrentTitle() end

---Creates a new title object.
---
---An object is created for this title (even if the page does not exist). If the text string does not specify a namespace, namespace (which may be any key found in [mw.site.namespaces](lua://mw.site.stats)) will be used.
---
---@param text string The title text.
---@param namespace? string | number The namespace for the title.
---@return mw.title | nil #The new title object, or nil if the title is invalid.
function mw.title.new(text, namespace) end

---Creates a new title object.
---
---An object is created for the title with that page_id. The title referenced will be counted as linked from the current page. The [expensive function count](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit) will be incremented if the title object created is not for a title that has already been loaded.
---
---@param id number The title page ID.
---@return mw.title | nil #The new title object, or nil if the page does not exist.
function mw.title.new(id) end

---Creates a title object with title `title` in namespace `namespace`, optionally with the specified fragment and interwiki prefix.
---
---Note that, unlike mw.title.new(), this method will always apply the specified namespace. For example, mw.title.makeTitle('Template', 'Module:Foo') will create an object for the page Template:Module:Foo, while mw.title.new('Module:Foo', 'Template') will create an object for the page Module:Foo.
---
---Note also that functionality for interwiki titles is limited to `interwiki` / `isExternal` / `isLocal` and URL-related methods; other methods might not behave as expected.
---
---@param namespace string | number The namespace for the title.
---@param title string The title text.
---@param fragment? string The fragment identifier.
---@param interwiki? string The interwiki prefix.
---@return mw.title | nil #The new title object, or nil if the title is invalid.
function mw.title.makeTitle(namespace, title, fragment, interwiki) end

---Whether this title is a subpage of the given title.
---@param title mw.title The title to check against.
---@return boolean #True if this title is a subpage of the given title, false otherwise.
function mw.title:isSubpageOf(title) end

---Whether this title is in the given namespace.
---@param ns string | number The namespace to check against.
---@return boolean #True if the title is in the given namespace, false otherwise.
function mw.title:inNamespace(ns) end

---Whether this title is in any of the given namespaces.
---@param ... string | number The namespaces to check against.
---@return boolean #True if the title is in any of the given namespaces, false otherwise.
function mw.title:inNamespaces(...) end

---Whether this title's subject namespace is in the given namespace.
---@param ns string | number The namespace to check against.
---@return boolean #True if the title's subject namespace is in the given namespace, false otherwise.
function mw.title:hasSubjectNamespace(ns) end

---Creates a subpage title object.
---
---Equivalent to `mw.title.makeTitle(self.namespace, self.text .. '/' .. text)`.
---
---@param text string The subpage text.
---@return mw.title #The new subpage title object.
function mw.title:subPageTitle(text) end

---Returns the title text encoded as it would be in a URL.
---@return string The encoded title text.
function mw.title:partialUrl() end

---Returns the full URL for this title.
---@param query? table | string The query parameters.
---@param proto? "http" | "https" | "relative" | "canonical" The URL scheme to use. Defaults to "relative".
---@return string #The full URL.
function mw.title:fullUrl(query, proto) end

---Returns the local URL for this title.
---@param query? table | string The query parameters.
---@return string #The local URL.
function mw.title:localUrl(query)
    return mw.uri.localUrl(self.prefixedText, query)
end

---Returns the canonical URL for this title.
---@param query? table | string The query parameters.
---@return string #The canonical URL.
function mw.title:canonicalUrl(query)
    return mw.uri.canonicalUrl(self.prefixedText, query)
end

---Returns the (unparsed) content of the page, or nil if there is no page. The page will be recorded as a transclusion.
---@return string | nil
function mw.title:getContent() end

-- no export
