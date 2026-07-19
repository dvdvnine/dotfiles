# AI Agent Guide

## Communication

* Follow the language and style of existing code comments and documentation.

## Repository map

### Core

* `init.lua` — Neovim entry point; initializes the global `Config` namespace for shared state and helper functions.
* `lua/core/options.lua` — global options and diagnostics configuration.
* `lua/core/autocmds.lua` — shared autocommands.
* `lua/core/keymaps.lua` — global key mappings and `<Leader>` groups.

### Core plugins

* `lua/plugins/init.lua` — entry point for plugin modules in `lua/plugins/`.
* `lua/plugins/mini.lua` — configuration for `mini.nvim` modules, adapted from [MiniMax](https://github.com/nvim-mini/MiniMax).
* `lua/plugins/languages.lua` — declarations for language tooling plugins, including LSP and formatting support.
* `lua/plugins/tree-sitter.lua` — Tree-sitter parser configuration.

### Runtime overrides

* `after/lsp/<server>.lua` — configuration for a specific LSP server.
* `after/ftplugin/<filetype>.lua` — settings for a specific filetype.

## Conventions

* Prefer existing project helpers and abstractions over direct Neovim API calls.
* Use direct Neovim APIs only when no suitable project helper exists.

### Autocommands and key mappings

* Create shared autocommands through `Config.new_autocmd()` and always provide `desc`.
* Add global key mappings through the helpers in `lua/core/keymaps.lua` and always provide `desc`.
* Preserve the `<Leader>{group}{key}` mapping hierarchy.
* Reuse existing `<Leader>` groups and avoid creating new ones unless necessary.
* Register new groups through `Config.leader_group_clues`.

### Plugin management and loading

* Manage external Neovim plugins exclusively through `vim.pack`; do not introduce another plugin manager.
* Declare plugins with `vim.pack.add()` in the same module as its configuration.
* Do not update plugins, run plugin update commands, or change plugin versions unless explicitly requested.
* Declare `Config.on_packchanged()` hooks before the corresponding `vim.pack.add()` call.
* Preserve the existing loading model:
  - `Config.now()` — for plugins and configuration required before the first render;
  - `Config.now_if_args()` — for synchronous loading only when Neovim starts with file arguments;
  - `Config.later()` — for all other plugins and settings that do not require synchronous loading.

### Language tooling

* When adding support for a language, independently evaluate whether it requires:
  - an LSP server;
  - a formatter;
  - a Tree-sitter parser.
* Enable LSP servers in `lua/plugins/languages.lua`.
* Place server-specific LSP configuration in `after/lsp/<server>.lua`.
* Configure formatting through `conform.nvim`.
* Install external tools, including formatters and LSP servers, through `mise`.
* Do not install external tools from the Neovim configuration or through Neovim plugins.

## Verification

* After changing Lua files, run:

  ```sh
  stylua --check init.lua lua after
  ```
