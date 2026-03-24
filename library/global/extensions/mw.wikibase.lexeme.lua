---@meta mw.wikibase.lexeme

---@class mw.wikibase.lexeme.entity.lexeme : mw.wikibase.entity
---@field lemmas table<string, {language: string, value: string}> Lemmas map keyed by language code.
---@field language string Item ID of the language.
---@field lexicalCategory string Item ID of the lexical category.
---@field forms table[] List of form entities.
---@field senses table[] List of sense entities.

---@class mw.wikibase.lexeme.entity.form : mw.wikibase.entity
---@field representations table<string, {language: string, value: string}> Representations map keyed by language code.
---@field grammaticalFeatures string[] List of grammatical feature item IDs.

---@class mw.wikibase.lexeme.entity.sense : mw.wikibase.entity
---@field glosses table<string, {language: string, value: string}> Glosses map keyed by language code.

mw.wikibase.lexeme = {}

---Split a Lexeme, Sense or Form ID into components.
---@param id string The entity id (e.g. "L1-S1").
---@return string, string | nil #Lexeme ID and optional Sense/Form ID.
function mw.wikibase.lexeme.splitLexemeId(id) end

---Lexeme entity methods.
mw.wikibase.lexeme.entity.lexeme = {}

---Get all lemmas of this lexeme.
---@return table[] #List of {text, language} tables.
function mw.wikibase.lexeme.entity.lexeme:getLemmas() end

---Get lemma in specific language or content language.
---@param languageCode? string
---@return string | nil, string | nil #Lemma text and language.
function mw.wikibase.lexeme.entity.lexeme:getLemma(languageCode) end

---Get the language item ID of this lexeme.
---@return string
function mw.wikibase.lexeme.entity.lexeme:getLanguage() end

---Get the lexical category item ID of this lexeme.
---@return string
function mw.wikibase.lexeme.entity.lexeme:getLexicalCategory() end

---Get all forms of this lexeme.
---@return mw.wikibase.lexeme.entity.form[]
function mw.wikibase.lexeme.entity.lexeme:getForms() end

---Get all senses of this lexeme.
---@return mw.wikibase.lexeme.entity.sense[]
function mw.wikibase.lexeme.entity.lexeme:getSenses() end

---Form entity methods.
mw.wikibase.lexeme.entity.form = {}

---Get all representations of this form.
---@return table[] #List of {text, language} tables.
function mw.wikibase.lexeme.entity.form:getRepresentations() end

---Get representation in specific language or content language.
---@param languageCode? string
---@return string | nil, string | nil #Representation text and language.
function mw.wikibase.lexeme.entity.form:getRepresentation(languageCode) end

---Get grammatical features of this form.
---@return string[]
function mw.wikibase.lexeme.entity.form:getGrammaticalFeatures() end

---Check if this form has a specific grammatical feature.
---@param itemId string
---@return boolean
function mw.wikibase.lexeme.entity.form:hasGrammaticalFeature(itemId) end

---Sense entity methods.
mw.wikibase.lexeme.entity.sense = {}

---Get all glosses of this sense.
---@return table[] #List of {text, language} tables.
function mw.wikibase.lexeme.entity.sense:getGlosses() end

---Get gloss in specific language or content language.
---@param languageCode? string
---@return string | nil, string | nil #Gloss text and language.
function mw.wikibase.lexeme.entity.sense:getGloss(languageCode) end

return mw.wikibase.lexeme