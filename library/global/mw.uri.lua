---@meta mw.uri

---@alias QueryParamsDecoded table<string, string | false | string[]>
---@alias QueryParamsEncoded table<string, string | number | false | (string | number)[]>

---@class mw.uri
---@field protocol string The protocol/scheme of the URI.
---@field user string The user information of the URI.
---@field password string The password of the URI.
---@field host string The host name of the URI.
---@field port integer The port of the URI.
---@field path string The path of the URI.
---@field query QueryParamsDecoded The query parameters of the URI.
---@field fragment string The fragment of the URI.
---@field userInfo string The user and password of the URI.
---@field hostPort string The host and port of the URI.
---@field authority string The user, password, host, and port of the URI.
---@field queryString string The query parameters of the URI as a string.
---@field relativePath string The relative path, query string, and fragment of the URI.
---
mw.uri = {}

---[Percent-encodes](https://en.wikipedia.org/wiki/Percent-encoding) the string.
---@param string string The string to be encoded.
---@param enctype "QUERY" | "PATH" | "WIKI" The encoding type. The default type, "QUERY", encodes spaces using '+' for use in query strings; "PATH" encodes spaces as %20; and "WIKI" encodes spaces as '_'. Note that the "WIKI" format is not entirely reversible, as both spaces and underscores are encoded as '_'.
---@return string #The encoded string.
function mw.uri.encode(string, enctype) end

---[Percent-decodes](https://en.wikipedia.org/wiki/Percent-encoding) the string.
---@param string string The string to be decoded.
---@param enctype "QUERY" | "PATH" | "WIKI" The decoding type. The default type, "QUERY", decodes '+' to space; "PATH" does not perform any extra decoding; and "WIKI" decodes '_' to space.
---@return mw.uri #The decoded URI object.
function mw.uri.decode(string, enctype) end

---Encodes a string for use in a MediaWiki URI fragment.
---@param string string The string to be encoded.
---@return string #The encoded string.
function mw.uri.anchorEncode(string)
    return mw.uri.encode(string, "WIKI")
end

---Encodes a table as a URI query string.
---@param parameters QueryParamsEncoded The table to be encoded as a query string.
---@return string #The encoded query string.
function mw.uri.buildQueryString(parameters) end

---Decodes the query string to a table.
---@param s string The query string to be decoded.
---@param i? number The starting position of the substring to be parsed. Defaults to 1.
---@param j? number The ending position of the substring to be parsed. Defaults to the length of the string.
---@return QueryParamsDecoded #The decoded query parameters.
function mw.uri.parseQueryString(s, i, j) end

---Returns a [URI object](lua://mw.uri) for the [canonical URL](https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Magic_words#URL_data) for a page, with optional query string/table.
---@param page string The page name.
---@param query? QueryParamsEncoded | string The optional query string/table.
---@return mw.uri #The URI object for the canonical URL.
function mw.uri.canonicalUrl(page, query) end

---Returns a [URI object](lua://mw.uri) for the full URL for a page, with optional query string/table.
---@param page string The page name.
---@param query? QueryParamsEncoded | string The optional query string/table.
---@return mw.uri #The URI object for the full URL.
function mw.uri.fullUrl(page, query) end

---Returns a [URI object](lua://mw.uri) for the local URL for a page, with optional query string/table.
---@param page string The page name.
---@param query? QueryParamsEncoded | string The optional query string/table.
---@return mw.uri #The URI object for the local URL.
function mw.uri.localUrl(page, query) end

---Constructs a new URI object for the passed string or table.
---@param input string | table | mw.uri The string or table to construct the URI object from.
---@return mw.uri #The new URI object.
function mw.uri.new(input) end

---Validates the passed table (or URI object).
---@param table table | mw.uri The table or URI object to validate.
---@return boolean | string #A boolean indicating whether the table was valid, and on failure a string explaining what problems were found.
function mw.uri.validate(table) end

---@param string string The string to be parsed into the URI object.
---@return mw.uri #The current URI object.
function mw.uri:parse(string) end

---Makes a copy of the URI object.
---@return mw.uri #A new URI object that is a copy of the current object.
function mw.uri:clone() end

---Merges the parameters table into the object's query table.
---@param parameters QueryParamsDecoded The parameters to merge into the query table.
---@return mw.uri #The current URI object.
function mw.uri:extend(parameters) end

-- no export
