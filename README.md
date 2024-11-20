# Lua Language Server Addon for MediaWiki Scribunto

This is an [addon](https://luals.github.io/wiki/addons/) for [MediaWiki](https://mediawiki.org) [Scribunto](https://mediawiki.org/wiki/Extension:Scribunto) that can be used by the [Lua Language Server](https://luals.github.io/). It adds [definitions](https://luals.github.io/wiki/definition-files/) for Scribunto APIs.

## How to use

The [addon manager](https://luals.github.io/wiki/addons/#addon-manager) for VS Code allows users to easily install and manage their addons. The addons are pulled from [LLS-Addons](https://github.com/LuaLS/LLS-Addons). It is recommended to use this addon along with [Wikitext](https://marketplace.visualstudio.com/items?itemName=RoweWilsonFrederiskHolme.wikitext) extension, which pulls module pages from MW and streamlines the editing flow.

<!-- To add your addon to the addon manager, please read the [README for LLS-Addons](https://github.com/LuaLS/LLS-Addons#readme). -->

For other editors, you will need to manually download the addon and configure your editor to use it. This can be done by:

- Create a directory for all LuaLS addons.
- `git clone` this repository into that directory.
- Open a LuaLS configuration file. Either
  - Use [client configuration](https://luals.github.io/wiki/configuration/#client-configuration) (editor-specific), or
  - Use [luarc.json file](https://luals.github.io/wiki/configuration/#luarcjson-file) (project-specific)
- Configure your editor to use the directory as the addon path.

```json
{
  "workspace.userThirdParty": ["/path/to/luals/addons"]
}
```

## Progress

Definitions for all vanilla Scribunto APIs are now complete. The definitions for extensions are still in progress.

<details>

- [x] `mw`
- [x] `frame` object
- [x] `mw.hash`
- [x] `mw.html`
- [x] `mw.language`
- [x] `mw.message`
- [x] `mw.site`
- [x] `mw.text`
- [x] `mw.title`
- [x] `mw.uri`
- [x] `mw.ustring`
- [x] `bit32`
- [x] `libraryUtil`
- [x] `luabit`
- [x] `strict`
- [x] `ustring`
</details>

<details>
<summary>Extensions</summary>

- [ ] `mw.wikibase`
- [ ] `mw.wikibase.lexeme`
- [ ] `mw.wikibase.mediainfo`
- [ ] `mw.bcmath`
- [x] `mw.smw`
- [x] `mw.ext.data`
- [ ] `mw.ext.cargo`
- [ ] `mw.ext.cattools`
- [ ] `mw.ext.FlaggedRevs`
- [x] `mw.ext.TitleBlacklist`
- [x] `mw.ext.ParserFunctions`
- [ ] `mw.ext.proofreadPage`
- [ ] `mw.ext.articlePlaceholder`
- [ ] `mw.ext.externalData`
- [ ] `mw.ext.UnlinkedWikibase`
- [ ] `mw.ext.seo`
- [ ] `mw.slots`
</details>

## Licensing and acknowledgements

This addon is licensed under the MIT license. See [LICENSE](LICENSE) for the full license text.

The definition documentations are derived from [Lua reference manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual) on MediaWiki.org, which is further derived from the [Lua 5.1 reference manual](https://www.lua.org/manual/5.1/index.html), both of which are available under the MIT license.

Generative AI is used to help generate the definitions based on the manual, which are further refined by human.

(Last updated to [revision 6855937](https://www.mediawiki.org/w/index.php?title=Extension:Scribunto/Lua_reference_manual&oldid=6855937))
