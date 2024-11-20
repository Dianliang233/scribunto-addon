---@meta mw.text

---@class mw.text
---@field JSON_PRESERVE_KEYS number Normally JSON's zero-based arrays are renumbered to Lua one-based sequence tables; to prevent this, pass mw.text.JSON_PRESERVE_KEYS.
---@field JSON_TRY_FIXING number To relax certain requirements in JSON, such as no terminal comma in arrays or objects, pass mw.text.JSON_TRY_FIXING.
---@field JSON_PRETTY number When set, the JSON output will be formatted with newlines and indentation.
---The text library provides some common text processing functions missing from the [String library](lua://string) and the [Ustring library](lua://mw.ustring). These functions are safe for use with UTF-8 strings.
mw.text = {}

---Replaces HTML entities in the string with the corresponding characters.
---
---If boolean `decodeNamedEntities` is omitted or false, the only named entities recognized are `&lt;` (<), `&gt;` (>), &`amp;` (&), `&quot;` (") and `&nbsp;` (the non-breaking space, U+00A0). Otherwise, the list of HTML5 named entities to recognize is loaded from PHP's [`get_html_translation_table`](https://php.net/get_html_translation_table) function.
---
---**Known bugs**: Approximately 600 of around 2,200 named entities in the HTML5 standard do not get decoded, even when `decodeNamedEntities` is used; this includes approximately 40 of around 250 entities which are also included in HTML4. This occurs because PHP's `get_html_translation_table` function returns only one mapping for each character, so for example `&rarr;` is not decoded since PHP returns only `&srarr;` as the mapping for `→`.
---
---@param string string The string to decode.
---@param decodeNamedEntities? boolean If true, decode named entities.
---@return string #The decoded string.
function mw.text.decode(string, decodeNamedEntities) end

---Replaces characters in a string with [HTML entities](https://en.wikipedia.org/wiki/HTML_entities).
---
---Five characters are replaced with the appropriate named entities: `<`, `>`, `&`, `"` and the non-breaking space (U+00A0). All others are replaced with numeric entities.
---
---If `charset` is supplied, it should be a string as appropriate to go inside brackets in a [Ustring pattern](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_patterns), i.e. the "set" in `[set]`. The default charset contains six characters: `<`, `>`, `&`, `"`, `'` and the non-breaking space (U+00A0).
---
---@param string string The string to encode.
---@param charset? string The set of characters to encode.
---@return string #The encoded string.
function mw.text.encode(string, charset) end

mw.text.JSON_PRESERVE_KEYS = 1
mw.text.JSON_TRY_FIXING = 2

---Decodes a JSON string.
---
---Normally JSON's zero-based arrays are renumbered to Lua one-based sequence tables; to prevent this, pass `mw.text.JSON_PRESERVE_KEYS`.
---
---To relax certain requirements in JSON, such as no terminal comma in arrays or objects, pass `mw.text.JSON_TRY_FIXING`. This is not recommended.
---
---Limitations:
---* Decoded JSON arrays may not be Lua sequences if the array contains null values.
---* JSON objects will drop keys having null values.
---* It is not possible to directly tell whether the input was a JSON array or a JSON object with sequential integer keys.
---* A JSON object having sequential integer keys beginning with 1 will decode to the same table structure as a JSON array with the same values, despite these not being at all equivalent, unless `mw.text.JSON_PRESERVE_KEYS` is used.
---
---@param string string The JSON string to decode.
---@param flags? number A combination of the flags `mw.text.JSON_PRESERVE_KEYS` and `mw.text.JSON_TRY_FIXING`.
---@return table #The decoded JSON object.
function mw.text.jsonDecode(string, flags) end

---Encodes a Lua value as a JSON string.
---
---Errors are raised if the passed value cannot be encoded in JSON.
---
---Normally Lua one-based sequence tables are encoded as JSON zero-based arrays; when `mw.text.JSON_PRESERVE_KEYS` is set in `flags`, zero-based sequence tables are encoded as JSON arrays.
---
---Limitations:
---* Empty tables are always encoded as empty arrays (`[]`), not empty objects (`{}`).
---* Sequence tables cannot be encoded as JSON objects without adding a "dummy" element.
---* To produce objects or arrays with nil values, a tricky implementation of the `__pairs` metamethod is required.
---* A Lua table having sequential integer keys beginning with 0 will encode as a JSON array, the same as a Lua table having integer keys beginning with 1, unless `mw.text.JSON_PRESERVE_KEYS` is used.
---* When both a number and the string representation of that number are used as keys in the same table, behavior is unspecified.
---
---@param value any The Lua value to encode.
---@param flags? number A combination of the flags `mw.text.JSON_PRESERVE_KEYS` and `mw.text.JSON_PRETTY`.
---@return string #The encoded JSON string.
function mw.text.jsonEncode(value, flags) end

---Removes all MediaWiki [strip markers](https://www.mediawiki.org/wiki/Strip_marker) from a string.
---
---@param string string The string to process.
---@return string #The string with all strip markers removed.
function mw.text.killMarkers(string) end

---Joins a list, prose-style. In other words, it's like table.concat() but with a different separator before the final item.
---
---Examples, using the default values for the messages:
---
---```lua
--- -- Returns the empty string
--- mw.text.listToText( {} )
---
--- -- Returns "1"
--- mw.text.listToText( { 1 } )
---
--- -- Returns "1 and 2"
--- mw.text.listToText( { 1, 2 } )
---
--- -- Returns "1, 2, 3, 4 and 5"
--- mw.text.listToText( { 1, 2, 3, 4, 5 } )
---
--- -- Returns "1; 2; 3; 4 or 5"
--- mw.text.listToText( { 1, 2, 3, 4, 5 }, '; ', ' or ' )
---```
---
---@param list table The list to join.
---@param separator? string The separator to use between items. Default is taken from MediaWiki:comma-separator in the wiki's content language.
---@param conjunction? string The conjunction to use before the final item. Default is taken from MediaWiki:and in the wiki's content language, concatenated with MediaWiki:word-separator.
---@return string #The joined string.
function mw.text.listToText(list, separator, conjunction) end

---Replaces various characters in the string with HTML entities to prevent their interpretation as wikitext.
---
---This includes:
---* The following characters: `"`, `&`, `'`, `<`, `=`, `>`, `[`, `]`, `{`, `|`, `}`
---* The following characters at the start of the string or immediately after a newline: `#`, `*`, `:`, `;`, space, tab (`\t`)
---* Blank lines will have one of the associated newline or carriage return characters escaped
---* `----` at the start of the string or immediately after a newline will have the first - escaped
---* `__` will have one underscore escaped
---* `://` will have the colon escaped
---* A whitespace character following `ISBN`, `RFC`, or `PMID` will be escaped
---
---@param string string The string to process.
---@return string #The processed string.
function mw.text.nowiki(string) end

---Splits the string into substrings at boundaries matching the [Ustring pattern](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_patterns) `pattern`.
---If `plain` is specified and `true`, pattern will be interpreted as a literal string rather than as a Lua pattern.
---
---For example, mw.text.split( 'a b\tc\nd', '%s' ) would return a table { 'a', 'b', 'c', 'd' }.
---
---If pattern matches the empty string, string will be split into individual characters.
---
---@param string string The string to split.
---@param pattern string The pattern to match.
---@param plain? boolean If true, pattern will be interpreted as a literal string.
---@return table #The table containing the substrings.
function mw.text.split(string, pattern, plain) end

---Returns an iterator function that will iterate over the substrings that would be returned by the equivalent call to [`mw.text.split`](lua://mw.text.split).
---
---@param string string The string to split.
---@param pattern string The pattern to match.
---@param plain? boolean If true, pattern will be interpreted as a literal string.
---@return fun(): string #The iterator function.
function mw.text.gsplit(string, pattern, plain) end

---Generates an HTML-style tag for name.
---
---If `content` is not given (or is nil), only the opening tag is returned. If `content` is boolean `false`, a self-closed tag is returned. Otherwise it must be a string or number, in which case that content is enclosed in the constructed opening and closing tag. Note the content is not automatically HTML-encoded; use [mw.text.encode()](lua://mw.text.encode) if needed.
---
---@see frame.extensionTag for properly returning extension tags such as `<ref>`
---@param name string The name of the tag.
---@param attrs? table<string, string | number | boolean> The attributes for the tag. Boolean `true` results in the key being output as an HTML5 valueless parameter; boolean `false` skips the key entirely
---@param content? string | number | boolean The content inside the tag.
---@return string #The generated HTML tag.
function mw.text.tag(name, attrs, content) end

---Generates an HTML-style tag for name.
---
---If `content` is not given (or is nil), only the opening tag is returned. If `content` is boolean `false`, a self-closed tag is returned. Otherwise it must be a string or number, in which case that content is enclosed in the constructed opening and closing tag. Note the content is not automatically HTML-encoded; use [mw.text.encode()](lua://mw.text.encode) if needed.
---
---@see frame.extensionTag for properly returning extension tags such as `<ref>`
---@param namedArg { name: string, attrs?: table<string, string | number | boolean>, content?: string | number | boolean }
---@return string #The generated HTML tag.
function mw.text.tag(namedArg) end

---Removes whitespace or other characters from the beginning and end of a string.
---
---If `charset` is supplied, it should be a string as appropriate to go inside brackets in a [Ustring pattern](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_patterns), i.e. the "set" in `[set]`. The default charset is ASCII whitespace, `%s`, which is equivalent to `"\t\r\n\f\v "`.
---
---@param string string The string to trim.
---@param charset? string The set of characters to trim.
---@return string #The trimmed string.
function mw.text.trim(string, charset) end

---Truncates text to the specified length in code points, adding `ellipsis` if truncation was performed.
---
---@param text string The text to truncate.
---@param length number The length to truncate to. If positive, the end of the string will be truncated; if negative, the beginning will be removed.
---@param ellipsis? string The ellipsis to use if truncation is performed. Defaults to MediaWiki:ellipsis depending on the wiki's content language.
---@param adjustLength? boolean If true, the resulting string including ellipsis will not be longer than the specified length.
---@return string #The truncated string.
function mw.text.truncate(text, length, ellipsis, adjustLength) end

---Replaces MediaWiki `<nowiki>` [strip markers](https://www.mediawiki.org/wiki/Strip_marker) with the corresponding text. Other types of strip markers are not changed.
---
---@param string string The string to process.
---@return string #The string with <nowiki> strip markers replaced.
function mw.text.unstripNoWiki(string) end

---Equivalent to `mw.text.killMarkers(mw.text.unstripNoWiki(string))`.
---
---This no longer reveals the HTML behind special page transclusion, <ref> tags, and so on as it did in earlier versions of Scribunto.
---
---@param string string The string to process.
---@return string #The processed string.
function mw.text.unstrip(string) end

-- no export
