-- NOTE: at its core, this is https://github.com/nvim-mini/MiniMax.

-- Config table to be able to pass data between scripts.
_G.Config = {}

-- Define custom autocmd group and helper to create an autocmd.
local custom_config_group = vim.api.nvim_create_augroup("custom-config", {})

Config.new_autocmd = function(event, pattern, callback, desc)
  local opts = {
    -- Inspect with `:autocmd custom-config`.
    group = custom_config_group,
    pattern = pattern,
    callback = callback,
    desc = desc,
  }
  vim.api.nvim_create_autocmd(event, opts)
end

-- Define custom `vim.pack.add()` hook helper.
-- NOTE: add them after this function and before the first `vim.pack.add()` call.
Config.on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then
      return
    end
    if not ev.data.active then
      vim.cmd.packadd(plugin_name)
    end

    callback(ev.data)
  end
  Config.new_autocmd("PackChanged", "*", f, desc)
end

-- Load now to have 'mini.misc' available for custom loading helpers.
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- stylua: ignore start
local misc = require("mini.misc")

Config.now = function(f) misc.safely('now', f) end
Config.later = function(f) misc.safely('later', f) end
Config.on_event = function(ev, f) misc.safely('event:' .. ev, f) end
Config.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later
-- stylua: ignore end

require("core.options")
require("core.autocmds")
require("core.keymaps")

require("plugins")
