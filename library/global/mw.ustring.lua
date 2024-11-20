---@meta mw.ustring

---@class mw.ustring
---@field maxPatternLength number The maximum allowed length of a pattern, in bytes.
---@field maxStringLength number The maximum allowed length of a string, in bytes.
---
---The ustring library is intended to be a direct reimplementation of the standard [String library](lua://string), except that the methods operate on characters in UTF-8 encoded strings rather than bytes.
---
---Most functions will raise an error if the string is not valid UTF-8; exceptions are noted.
---
mw.ustring = {}

---Returns the internal numeric codes of the characters `s[i], s[i+1], ..., s[j]`; identical to [string.byte()](lua://string.byte).
---
---@param s string The string to extract characters from.
---@param i? integer The index of the first character to extract.
---@param j? integer The index of the last character to extract.
---@return integer ... #The internal numeric codes of the characters.
function mw.ustring.byte(s, i, j) end

---Returns the byte offset of a character in the string.
---
---@param s string The string to find the byte offset in.
---@param l? integer The character position to find the byte offset for. Defaults to 1. The character at l == 1 is the first character starting at or after byte i; the character at l == 0 is the first character starting at or before byte i. Note this may be the same character. Greater or lesser values of l are calculated relative to these.
---@param i? integer The starting byte position. Defaults to 1. When negative, counts from the end of the string.
---@return integer #The byte offset of the character.
function mw.ustring.byteoffset(s, l, i) end

---Returns a string containing the characters with the given Unicode codepoints.
---
---@param ... integer The Unicode codepoints to convert to characters.
---@return string #The resulting string.
function mw.ustring.char(...) end

---Returns the Unicode codepoints of the characters `s[i], s[i+1], ..., s[j]`; much like [string.byte()](lua://string.byte), except that the return values are codepoints and the offsets are characters rather than bytes.
---
---@param s string The string to extract codepoints from.
---@param i? integer The index of the first character to extract. Defaults to 1.
---@param j? integer The index of the last character to extract. Defaults to i.
---@return integer ... #The Unicode codepoints of the characters.
function mw.ustring.codepoint(s, i, j) end

---Looks for the first match of [`pattern`](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_patterns) in the string `s`. Much like [`string.find()`](lua://string.find) except that the pattern is extended as described in Ustring patterns and the `init` offset is in characters rather than bytes.
---
---@param s string The string to search in.
---@param pattern string The pattern to search for.
---@param init? integer The starting character position to start the search. Defaults to 1.
---@param plain? boolean If true, the pattern is interpreted as a plain string, not a pattern. Defaults to false.
---@return integer, integer, string ... #The start and end positions of the match, plus any captured substrings.
function mw.ustring.find(s, pattern, init, plain) end

---Returns a formatted string; identical to [string.format()](lua://string.format). Widths and precisions for strings are expressed in bytes, not codepoints.
---
---@param format string The format string.
---@param ... any The values to format.
---@return string #The formatted string.
function mw.ustring.format(format, ...) end

---Returns an iterator for the Unicode codepoints of the characters `s[i], s[i+1], ..., s[j]`.
---
---@param s string The string to extract codepoints from.
---@param i? integer The index of the first character to extract. Defaults to 1.
---@param j? integer The index of the last character to extract. Defaults to -1.
---@return fun(): integer  #An iterator function that returns Unicode codepoints.
function mw.ustring.gcodepoint(s, i, j) end

---Returns an iterator for all matches of [`pattern`](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_patterns) in the string `s`. Much like [`string.gmatch()`](lua://string.gmatch) except that the pattern is extended.
---
---@param s string The string to search in.
---@param pattern string The pattern to search for.
---@return fun(): string ... #An iterator function that returns the captures.
function mw.ustring.gmatch(s, pattern) end

---Returns a copy of `s` in which all (or the first `n`, if given) occurrences of the `pattern` have been replaced by `repl`. Much like [string.gsub()](lua://string.gsub) except that the pattern is extended as described in Ustring patterns.
---
---@param s string The string to search and replace in.
---@param pattern string The pattern to search for.
---@param repl string | function | table The replacement string or a function that returns the replacement string.
---@param n? integer The maximum number of replacements to make. Defaults to all occurrences.
---@return string, integer #The resulting string and the number of replacements made.
function mw.ustring.gsub(s, pattern, repl, n) end

---Returns true if the string is valid UTF-8, false if not.
---
---@param s string The string to check.
---@return boolean #True if the string is valid UTF-8, false if not.
function mw.ustring.isutf8(s) end

---Returns the length of the string in codepoints, or nil if the string is not valid UTF-8. Much like [string.len()](lua://string.len) except that the length is in codepoints rather than bytes.
---
---@param s string The string to measure.
---@return integer|nil #The length of the string in codepoints, or nil if the string is not valid UTF-8.
function mw.ustring.len(s) end

---Returns a copy of the string with all uppercase characters converted to lowercase. Much like [string.lower()](lua://string.lower), except that all characters with lowercase to uppercase definitions in Unicode are converted.
---
---If the [Language library](lua://mw.language) is also loaded, this will instead call [lc()](lua://mw.language.lc) on the default language object.
---
---@param s string The string to convert to lowercase.
---@return string #The resulting string with all uppercase characters converted to lowercase.
function mw.ustring.lower(s) end

---Looks for the first match of [`pattern`](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_patterns) in the string `s`. Much like [`string.match()`](lua://string.match) except that the pattern is extended as described in Ustring patterns and the `init` offset is in characters rather than bytes.
---
---@param s string The string to search in.
---@param pattern string The pattern to search for.
---@param init? integer The starting character position to start the search. Defaults to 1.
---@return string ... #The captured substrings.
function mw.ustring.match(s, pattern, init) end

---Returns a string that is the concatenation of `n` copies of the string `s`. Identical to [string.rep()](lua://string.rep).
---
---@param s string The string to repeat.
---@param n integer The number of times to repeat the string.
---@return string #The resulting string.
function mw.ustring.rep(s, n) end

---Returns the substring of `s` that starts at `i` and continues until `j`; much like [string.sub()](lua://string.sub) except that the offsets are characters rather than bytes.
---
---@param s string The string to extract the substring from.
---@param i integer The starting character position.
---@param j? integer The ending character position. Defaults to -1.
---@return string #The resulting substring.
function mw.ustring.sub(s, i, j) end

---Converts the string to [Normalization Form C](https://en.wikipedia.org/wiki/Normalization_Form_C) (also known as Normalization Form Canonical Composition).
---
---@param s string The string to normalize.
---@return string | nil #The normalized string, or nil if the string is not valid UTF-8.
function mw.ustring.toNFC(s) end

---Converts the string to [Normalization Form D](https://en.wikipedia.org/wiki/Normalization_Form_D) (also known as Normalization Form Canonical Decomposition).
---
---@param s string The string to normalize.
---@return string | nil #The normalized string, or nil if the string is not valid UTF-8.
function mw.ustring.toNFD(s) end

---Converts the string to [Normalization Form KC](https://en.wikipedia.org/wiki/Normalization_Form_KC) (also known as Normalization Form Compatibility Composition).
---
---@param s string The string to normalize.
---@return string | nil #The normalized string, or nil if the string is not valid UTF-8.
function mw.ustring.toNFKC(s) end

---Converts the string to [Normalization Form KD](https://en.wikipedia.org/wiki/Normalization_Form_KD) (also known as Normalization Form Compatibility Decomposition).
---
---@param s string The string to normalize.
---@return string | nil #The normalized string, or nil if the string is not valid UTF-8.
function mw.ustring.toNFKD(s) end

---Returns a copy of the string with all uppercase characters converted to uppercase. Much like [string.upper()](lua://string.upper), except that all characters with uppercase to lowercase definitions in Unicode are converted.
---
---If the [Language library](lua://mw.language) is also loaded, this will instead call [uc()](lua://mw.language.uc) on the default language object.
---
---@param s string The string to convert to uppercase.
---@return string #The resulting string with all uppercase characters converted to uppercase.
function mw.ustring.upper(s) end

-- no export
