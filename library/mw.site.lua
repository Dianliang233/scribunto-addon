---@meta mw.site

---@class Namespace
---@field id number Namespace number.
---@field name string Local namespace name.
---@field canonicalName string Canonical namespace name.
---@field displayName string Set on namespace 0, the name to be used for display (since the name is often the empty string).
---@field hasSubpages boolean Whether subpages are enabled for the namespace.
---@field hasGenderDistinction boolean Whether the namespace has different aliases for different genders.
---@field isCapitalized boolean Whether the first letter of pages in the namespace is capitalized.
---@field isContent boolean Whether this is a content namespace.
---@field isIncludable boolean Whether pages in the namespace can be transcluded.
---@field isMovable boolean Whether pages in the namespace can be moved.
---@field isSubject boolean Whether this is a subject namespace.
---@field isTalk boolean Whether this is a talk namespace.
---@field defaultContentModel string The default content model for the namespace, as a string.
---@field aliases string[] List of aliases for the namespace.
---@field subject Namespace Reference to the corresponding subject namespace's data.
---@field talk Namespace Reference to the corresponding talk namespace's data.
---@field associated Namespace Reference to the associated namespace's data.

---@class mw.site
---@field currentVersion string A string holding the current version of MediaWiki.
---@field scriptPath string The value of $wgScriptPath.
---@field server string The value of $wgServer.
---@field siteName string The value of $wgSitename.
---@field stylePath string The value of $wgStylePath.
---@field namespaces table<number | string, Namespace> A table of namespace objects, indexed by namespace number or name (localized or canonical).
---@field contentNamespaces table<number | string, Namespace> A table of content namespaces, indexed by namespace number or name (localized or canonical).
---@field subjectNamespaces table<number | string, Namespace> A table of subject namespaces, indexed by namespace number or name (localized or canonical).
---@field talkNamespaces table<number | string, Namespace> A table of talk namespaces, indexed by namespace number or name (localized or canonical).
---
---Access to site information.
mw.site = {}

---@class mw.site.stats
---@field pages number Number of pages in the wiki.
---@field articles number Number of articles in the wiki.
---@field edits number Number of edits in the wiki.
---@field users number Number of users in the wiki.
---@field activeUsers number Number of active users in the wiki.
---@field admins number Number of users in group 'sysop' in the wiki.
mw.site.stats = {}

---@class CategoryStats
---@field all number Total pages, files, and subcategories.
---@field subcats number Number of subcategories.
---@field files number Number of files.
---@field pages number Number of pages.

---Gets statistics about the category.
---
---This function is [expensive](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgExpensiveParserFunctionLimit).
---
---@param category string The category to get statistics for.
---@overload fun(category: string, which: "*"): CategoryStats
---@overload fun(category: string, which: "all" | "subcats" | "files" | "pages"): number
function mw.site.stats.pagesInCategory(category, which) end

---Gets the number of pages in the given namespace.
---
---@param namespace number The namespace to get the number of pages for.
---@return number #The number of pages in the given namespace.
function mw.site.stats.pagesInNamespace(namespace) end

---Gets the number of users in the given group.
---
---@param group string The group to get the number of users for.
---@return number #The number of users in the given group.
function mw.site.stats.usersInGroup(group) end

---@class Interwiki
---@field prefix string The interwiki prefix.
---@field url string The URL that the interwiki points to. The page name is represented by the parameter $1.
---@field isProtocolRelative boolean A boolean showing whether the URL is protocol-relative.
---@field isLocal boolean Whether the URL is for a site in the current project.
---@field isCurrentWiki boolean Whether the URL is for the current wiki.
---@field isTranscludable boolean Whether pages using this interwiki prefix are transcludable. This requires scary transclusion, which is disabled on Wikimedia wikis.
---@field isExtraLanguageLink boolean Whether the interwiki is listed in $wgExtraInterlanguageLinkPrefixes.
---@field displayText string | nil For links listed in $wgExtraInterlanguageLinkPrefixes, this is the display text shown for the interlanguage link. Nil if not specified.
---@field tooltip string | nil For links listed in $wgExtraInterlanguageLinkPrefixes, this is the tooltip text shown when users hover over the interlanguage link. Nil if not specified.

---Gets data about available interwiki prefixes.
---
---@param filter string | nil The filter to apply ("local", "!local", or nil). A "local" prefix in this context is one that is for the same project. For example, on the English Wikipedia, other-language Wikipedias are considered local, while Wiktionary and such are not.
---@return table<string, Interwiki> #A table holding data about available interwiki prefixes.
function mw.site.interwikiMap(filter) end

-- no export
