---@meta mw.svg

---The SVG library provides a way to create SVG images rendered as `<img>` elements in HTML. SVGs are rendered in [secure animated mode](https://svgwg.org/specs/integration/#secure-animated-mode). This means that scripts and external resources are not rendered but declarative animations such as SMIL or CSS @keyframe are allowed as long as they don't need user interaction.
---
---CSS from the surrounding page do not affect the SVG elements inside the file so you cannot use CSS variables like --color-base in your svg. You can however use prefers-color-scheme @media queries or the light-dark() CSS function to make the SVG night mode compatible.
mw.svg = {}

---@class MwSvg
local MwSvg = {}

---Initialize a new SVG image.
---@return MwSvg
function mw.svg.new() end

---Sets the inner content of the `<svg>` tag. Contents can be manipulated with the [mw.html](lua://mw.html) library for convenience.
---@param content string
---@return MwSvg
function MwSvg:setContent(content) end

---Sets an attribute on the `<svg>` tag.
---@param name string The name of the attribute to set.
---@param value string The value of the attribute to set.
---@return MwSvg
function MwSvg:setAttribute(name, value) end

---Sets an attribute of the resulting `<img>` tag.
---@param name 'width' | 'height' | 'class' | 'id' | 'alt' | 'title' | 'style' The name of the attribute to set.
---@param value string The value of the attribute to set.
---@return MwSvg
function MwSvg:setImgAttribute(name, value) end

---Generates the final `<img>` tag.
---@return string #A [strip marker](https://www.mediawiki.org/wiki/Strip_marker).
function MwSvg:toImage() end

---Generates the final SVG as a string. Note that the output cannot be used directly in wikitext.
---@return string #A string containing the SVG XML.
function MwSvg:toString() end

return mw.svg
