---@meta mw.language

---@class mw.language
---Language module for handling language-specific operations and utilities.
---
---Language codes are described at [language code](https://www.mediawiki.org/wiki/Special:MyLanguage/Language_code). Many of MediaWiki's language codes are similar to [IETF language tags](https://en.wikipedia.org/wiki/IETF_language_tag), but not all MediaWiki language codes are valid IETF tags or vice versa.
---
---Get instances of `mw.language` using [`mw.language.new`](lua://mw.language.new) and [`mw.language.getContentLanguage`](lua://mw.language.getContentLanguage).
mw.language = {}

return mw.language
