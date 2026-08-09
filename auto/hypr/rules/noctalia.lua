hl.layer_rule({
  match = { namespace = "^noctalia-notification$" },

  no_screen_share = true,
})

hl.window_rule({
  match = { class = "dev.noctalia.Noctalia" },

  float = true,
  size = { 1080, 920 },
})
