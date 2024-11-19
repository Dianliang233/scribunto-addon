---@meta mw.language

---@class mw.language
---Language module for handling language-specific operations and utilities.
---
---Language codes are described at [language code](https://www.mediawiki.org/wiki/Special:MyLanguage/Language_code). Many of MediaWiki's language codes are similar to [IETF language tags](https://en.wikipedia.org/wiki/IETF_language_tag), but not all MediaWiki language codes are valid IETF tags or vice versa.
---
---Get instances of `mw.language` using [`mw.language.new`](lua://mw.language.new) and [`mw.language.getContentLanguage`](lua://mw.language.getContentLanguage).
mw.language = {}

---Get the full name of the language for the given language code in a language.
---
---@param code string The language code.
---@param inLanguage? string Name translated in target language if a value is given for inLanguage and [Extension:CLDR](https://www.mediawiki.org/wiki/Special:MyLanguage/Extension:CLDR) is installed. Otherwise and by default uses native name (language autonym).
---@return string #The language name.
function mw.language.fetchLanguageName(code, inLanguage) end

---Fetch the list of languages known to MediaWiki, returning a table mapping language code to language name.
---
---By default, the name returned is the language autonym; passing a language code for `inLanguage` returns all names in that language.
---
---By default, only language names known to MediaWiki are returned; passing 'all' for `include` will return all available languages (from [Extension:CLDR](https://www.mediawiki.org/wiki/Special:MyLanguage/Extension:CLDR)), while passing 'mwfile' will include only languages having customized messages included with MediaWiki core or enabled extensions. To explicitly select the default, 'mw' may be passed.
---
---@overload fun(): table<string, string>
---@overload fun(inLanguage: string): table<string, string>
---@param? inLanguage string The language code to return names in that language.
---@param? include string The inclusion criteria for languages ('all', 'mwfile', 'mw').
---@return table <string, string> table mapping language code to language name.
function mw.language.fetchLanguageNames(inLanguage, include) end

---Get a new language object for the wiki's default content language.
---
---@return mw.language #A new language object.
function mw.language.getContentLanguage() end

mw.getContentLanguage = mw.language.getContentLanguage

---Returns a list of MediaWiki's fallback language codes for the specified code.
---
---@param code string The language code to check.
---@return table<mw.language> #A list of fallback language codes.
function mw.language.getFallbacksFor(code) end

---Checks whether a language code is known to MediaWiki.
---
---A language code is "known" if it is a "valid built-in code" (i.e. it returns `true` for [mw.language.isValidBuiltInCode](lua://mw.language.isValidBuiltInCode)) and returns a non-empty string for [mw.language.fetchLanguageName](lua://mw.language.fetchLanguageName).
---
---@param code string The language code to check.
---@return boolean #True if the language code is known.
function mw.language.isKnownLanguageTag(code) end

---Checks whether any localization is available for that language code in MediaWiki.
---
---A language code is "supported" if it is a "valid" code (returns true for [mw.language.isValidCode](lua://mw.language.isValidCode)), contains no uppercase letters, and has a message file in the currently-running version of MediaWiki.
---
---It is possible for a language code to be "supported" but not "known" (i.e. returning true for [mw.language.isKnownLanguageTag](lua://mw.language.isKnownLanguageTag)). Also note that certain codes are "supported" despite [mw.language.isValidBuiltInCode](lua://mw.language.isValidBuiltInCode) returning `false`.
---
---@param code string The language code to check.
---@return boolean #True if the language code is supported.
function mw.language.isSupportedLanguage(code) end

---Check if a language code is of a valid form for the purposes of internal customisation of MediaWiki.
---
---The code may not actually correspond to any known language.
---
---A language code is a "valid built-in code" if it is a "valid" code (i.e. it returns true for [mw.language.isValidCode](lua://mw.language.isValidCode)); consists of only ASCII letters, numbers, and hyphens; and is at least two characters long.
---
---Note that some codes are "supported" (i.e. returning `true` from [mw.language.isSupportedLanguage](lua://mw.language.isSupportedLanguage)) even though this function returns `false`.
---
---@param code string The language code to check.
---@return boolean #True if the language code is a valid built-in code.
function mw.language.isValidBuiltInCode(code) end

---Returns `true` if a language code string is of a valid form, whether or not it exists. This includes codes which are used solely for customization via the MediaWiki namespace.
---
---The code may not actually correspond to any known language.
---
---A language code is valid if it does not contain certain unsafe characters (colons, single- or double-quotes, slashes, backslashes, angle brackets, ampersands, or ASCII NULs) and is otherwise allowed in a page title.
---
---@param code string The language code to check.
---@return boolean #True if the language code is of a valid form.
function mw.language.isValidCode(code) end

---Creates a new [language object](lua://mw.language). Language objects do not have any publicly accessible properties, but they do have several methods, which are documented below.
---
---There is a limit of 200 on the number of distinct language codes that may be used on a page. Exceeding this limit will result in errors.
---
---@param code string The language code.
---@return mw.language #A new language object.
function mw.language.new(code) end

mw.getLanguage = mw.language.new

---Returns the language code for this language object.
---
---@return string #The language code.
function mw.language:getCode() end

---Returns the standard [BCP-47](https://en.wikipedia.org/wiki/IETF_language_tag) language code for this language object. This is the code string which is appropriate to use in HTML, for example as the value of a `lang` attribute.
---
---@return string #The BCP-47 language code.
function mw.language:toBcp47Code() end

---Returns a list of MediaWiki's fallback language codes for this language object.
---
---Equivalent to `mw.language.getFallbacksFor(lang:getCode())`.
---
---@return table<mw.language> #A list of fallback language codes.
function mw.language:getFallbackLanguages() end

---Returns `true` if the language is written right-to-left, `false` if it is written left-to-right.
---
---@return boolean #True if the language is written right-to-left.
function mw.language:isRTL() end

---Converts the string to lowercase, honoring any special rules for the given language.
---
---When the [Ustring library](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_library) is loaded, the [mw.ustring.lower()](lua://mw.ustring.lower) function is implemented as a call to `mw.language.getContentLanguage():lc(s)`.
---
---@param s string The string to convert to lowercase.
---@return string #The lowercase string.
function mw.language:lc(s) end

---Converts the first character of the string to lowercase, honoring any special rules for the given language.
---
---@see mw.language.lc
---@param s string The string to convert the first character to lowercase.
---@return string #The string with the first character in lowercase.
function mw.language:lcfirst(s) end

---Converts the string to uppercase, honoring any special rules for the given language.
---
---When the [Ustring library](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_library) is loaded, the [mw.ustring.upper()](lua://mw.ustring.upper) function is implemented as a call to `mw.language.getContentLanguage():uc(s)`.
---
---@param s string The string to convert to uppercase.
---@return string #The uppercase string.
function mw.language:uc(s) end

---Converts the first character of the string to uppercase, honoring any special rules for the given language.
---
---@see mw.language.uc
---@param s string The string to convert the first character to uppercase.
---@return string #The string with the first character in uppercase.
function mw.language:ucfirst(s) end

---Converts the string to a representation appropriate for case-insensitive comparison. Note that the result may not make any sense when displayed.
---
---@param s string The string to convert for case-insensitive comparison.
---@return string #The case-folded string.
function mw.language:caseFold(s) end

---Formats a number with grouping and decimal separators appropriate for the given language. Given 123456.78, this may produce "123,456.78", "123.456,78", or even something like "١٢٣٬٤٥٦٫٧٨" depending on the language and wiki configuration.
---
---@param n number The number to format.
---@param options? { noCommafy: boolean } A table of options. Set `noCommafy` to true to omit grouping separators and use a dot (.) as the decimal separator. Digit transformation may still occur, which may include transforming the decimal separator.
---@return string #The formatted number.
function mw.language:formatNum(n, options) end

---Formats a date according to the given format string.
---
---If `timestamp` is omitted, the default is the current time. The value for `local` must be a boolean or nil; if `true`, the time is formatted in the [wiki's local time](https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgLocaltimezone) rather than in UTC.
---
---The format string and supported values for `timestamp` are identical to those for the [#time parser function](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Extension:ParserFunctions#.23time) from [Extension:ParserFunctions](https://www.mediawiki.org/wiki/Special:MyLanguage/Extension:ParserFunctions). Note however that backslashes may need to be doubled in a Lua string literal, since Lua also uses backslash as an escape character while wikitext does not:
---
---```lua
--- -- This string literal contains a newline, not the two characters "\n", so it is not equivalent to {{#time:\n}}.
--- lang:formatDate( '\n' )
---
--- -- This is equivalent to {{#time:\n}}, not {{#time:\\n}}.
--- lang:formatDate( '\\n' )
---
--- -- This is equivalent to {{#time:\\n}}, not {{#time:\\\\n}}.
--- lang:formatDate( '\\\\n' )
---```
---
---@param format string The format string.
---@param timestamp? string The timestamp to format.
---@param isLocal? boolean If true, the time is formatted in the wiki's local time rather than in UTC.
---@return string #The formatted date.
function mw.language:formatDate(format, timestamp, isLocal) end

---Formats a duration in a human-readable way.
---
---@param seconds number The duration in seconds.
---@param chosenIntervals? table<'millennia' | 'centuries' | 'decades' | 'years' | 'weeks' | 'days' | 'hours' | 'minutes' | 'seconds'> The interval units to use in the response.
---@return string #The formatted duration.
function mw.language:formatDuration(seconds, chosenIntervals) end

---Parses a formatted number string and returns the actual number.
---
---This function is the inverse of [`lang:formatNum()`](lua://mw.language.formatNum), converting a language-specific formatted number back to a numeric value.
---
---@param s string The formatted number string.
---@return number #The parsed number.
function mw.language:parseFormattedNumber(s) end

---Chooses the appropriate grammatical form from forms based on the number n.
---
---For example, in English you might use `n .. ' ' .. lang:plural(n, 'sock', 'socks')` or `n .. ' ' .. lang:plural(n, { 'sock', 'socks' })` to generate grammatically-correct text whether there is only 1 sock or 200 socks.
---
---The necessary values for the sequence are language-dependent, see [localization of magic words](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Magic_words#Localization) and [translatewiki's FAQ on PLURAL](https://translatewiki.net/wiki/Special:MyLanguage/FAQ#PLURAL) for some details.
---
---@overload fun(n: number, ...: string): string
---@overload fun(n: number, forms: table): string
---@param n number The number to base the pluralization on.
---@param forms table  The forms to choose from.
---@return string #The appropriate grammatical form.
function mw.language:convertPlural(n, forms) end

mw.language.plural = mw.language.convertPlural

---Chooses the appropriate inflected form of word for the given inflection code case.
---
---Note the different parameter order between the two aliases. `convertGrammar` matches the order of the method of the same name on MediaWiki's Language object, while `grammar` matches the order of the parser function of the same name, documented at [Help:Magic words#Localisation](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Magic_words#Localisation).
---
---The possible values for word and case are language-dependent, see [Special:MyLanguage/Help:Magic words#Localisation](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Magic_words#Localisation) and [translatewiki:Grammar](https://translatewiki.net/wiki/Special:MyLanguage/Grammar) for some details.
---
---@param case string The inflection code.
---@param word string The word to inflect.
---@return string #The appropriate inflected form.
function mw.language:grammar(case, word) end

---Chooses the appropriate inflected form of word for the given inflection code case.
---
---Note the different parameter order between the two aliases. `convertGrammar` matches the order of the method of the same name on MediaWiki's Language object, while `grammar` matches the order of the parser function of the same name, documented at [Help:Magic words#Localisation](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Magic_words#Localisation).
---
---The possible values for word and case are language-dependent, see [Special:MyLanguage/Help:Magic words#Localisation](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Magic_words#Localisation) and [translatewiki:Grammar](https://translatewiki.net/wiki/Special:MyLanguage/Grammar) for some details.
---
---@param word string The word to inflect.
---@param case string The inflection code.
---@return string #The appropriate inflected form.
function mw.language:convertGrammar(word, case) end

---Chooses the string corresponding to the gender of what.
---
---@overload fun(what: string, masculine: string, feminine: string, neutral: string): string
---@param what "male" | "female" | string Either "male", "female", or a registered user name. Gender of this string determines which string is chosen.
---@param forms table<string> The masculine, feminine, neutral forms.
---@return string #The appropriate form based on gender.
function mw.language:gender(what, forms) end

---Returns a Unicode arrow character corresponding to direction.
---
---Values `forwards` and `backwards` correspond to are directional-dependent horizontal arrows.
---
---@param direction "forwards" | "backwards" | "left" | "right" | "up" | "down" The direction for the arrow.
---@return string #The Unicode arrow character.
function mw.language:getArrow(direction) end

---Returns "ltr" or "rtl", depending on the directionality of the language.
---
---@return "ltr" | "rtl" #The directionality of the language.
function mw.language:getDir() end

---Returns a string containing either U+200E (the left-to-right mark) or U+200F (the right-to-left mark), depending on the directionality of the language and whether `opposite` is a true or false value.
---
---@param opposite? boolean If true, returns the mark for the opposite direction.
---@return string #The directionality mark.
function mw.language:getDirMark(opposite) end

---Returns a string containing either "&lrm;" or "&rlm;", depending on the directionality of the language and whether `opposite` is a true or false value.
---
---@param opposite? boolean If true, returns the entity for the opposite direction.
---@return string #The directionality mark entity.
function mw.language:getDirEntity(opposite) end

---Breaks a duration in seconds into more human-readable units, e.g. 12345 to 3 hours, 25 minutes and 45 seconds, returning the result as a table mapping unit names to numbers.
---
---@param seconds number The duration in seconds.
---@param chosenIntervals? table<'millennia' | 'centuries' | 'decades' | 'years' | 'weeks' | 'days' | 'hours' | 'minutes' | 'seconds'> The interval units to use in the response.
---@return table<string, number> #A table mapping unit names to numbers.
function mw.language:getDurationIntervals(seconds, chosenIntervals) end

-- no export
