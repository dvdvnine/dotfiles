local SPACENAME = "special:terminal"

hl.window_rule({
  match = { initial_title = "^quick-terminal$" },

  workspace = SPACENAME,
  float = true,
  size = { 1440, 920 },
})
