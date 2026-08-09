hl.workspace_rule({
  workspace = "1",
  monitor = "DP-1",
  persistent = true,
})

hl.workspace_rule({
  workspace = "2",
  monitor = "DP-1",
  persistent = true,
})

hl.workspace_rule({
  workspace = "3",
  monitor = "DP-1",
  persistent = true,
})

hl.workspace_rule({
  workspace = "special:terminal",

  on_created_empty = "ghostty +new-window --title=quick-terminal",
})

local GAPS_OUT = hl.get_config("general.gaps_out")

hl.workspace_rule({
  workspace = "special:scratchpad",

  layout = "scrolling",
  layout_opts = { direction = "down" },

  gaps_out = {
    top = GAPS_OUT.top * 2,
    left = GAPS_OUT.left * 2 + 1808, -- total width of all-side margins and app widths
    right = GAPS_OUT.right * 2,
    bottom = GAPS_OUT.bottom * 2,
  },
})

hl.workspace_rule({
  workspace = "special:game",

  layout = "scrolling",
  gaps_out = {
    top = GAPS_OUT.top * 0.5,
    left = GAPS_OUT.left * 0.5,
    right = GAPS_OUT.right * 0.5,
    bottom = 120,
  },
})
