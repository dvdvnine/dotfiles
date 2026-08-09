local SPACENAME = "special:game"

local GAPS_OUT = hl.get_config("general.gaps_out")
local BORDER = hl.get_config("general.border_size")

hl.window_rule({
  -- NOTE: dot not include "lunatranslator.exe" here.

  match = {
    class = "(?i)^(.+[.]exe|steam_proton)$",
    initial_class = "negative:^(lunatranslator|explorer)[.]exe$",
  },

  workspace = SPACENAME,

  no_screen_share = true,
})

hl.window_rule({
  match = { class = "^lunatranslator[.]exe$" },

  workspace = SPACENAME,
  float = true,

  no_blur = true,
  no_screen_share = true,
})

hl.window_rule({
  -- TODO: window is related to the app update?

  match = { class = "^explorer[.]exe$" },

  workspace = SPACENAME,
  float = true,
  size = { 50, 50 },
  move = {
    string.format("monitor_w-%s-%s", 50, GAPS_OUT.right + BORDER),
    string.format("monitor_h-%s-%s", 50, GAPS_OUT.bottom + BORDER),
  },
})
