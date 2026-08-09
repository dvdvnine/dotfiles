hl.window_rule({
  match = { class = "^local.btop$" },

  float = true,
  size = { 1080, 920 },
})

hl.window_rule({
  match = { class = "^xdg-desktop-portal-gtk$" },

  float = true,
  size = { 1080, 920 },
})

hl.window_rule({
  match = { class = "^org.gnome.FileRoller$" },

  float = true,
  size = { 1080, 920 },
})

hl.window_rule({
  match = { class = "^org.gnome.NautilusPreviewer$" },

  float = true,
})

hl.window_rule({
  match = { class = "^Throne$" },

  float = true,
  max_size = { 1080, 920 },
})

hl.window_rule({
  match = { class = "^com.usebottles.bottles$" },

  float = true,
  pin = true,
  max_size = { 1080, 920 },
})

hl.window_rule({
  match = { class = "^org.qbittorrent.qBittorrent$" },

  float = true,
  max_size = { 1080, 920 },

  no_screen_share = true,
})

hl.window_rule({
  match = { class = "^org.nicotine_plus.Nicotine$" },

  float = true,
  size = { 1440, 920 },

  no_screen_share = true,
})

hl.window_rule({
  match = { class = "^mpv$" },

  render_unfocused = true,
})

local BORDER = hl.get_config("general.border_size")
local GAPS_OUT = hl.get_config("general.gaps_out")

local CLOCK_H = 340

hl.window_rule({
  match = { class = "^org.gnome.clocks$" },

  float = true,
  size = { 440, CLOCK_H },
  move = {
    GAPS_OUT.left * 0.5 + BORDER,
    string.format("monitor_h-%d-%d", CLOCK_H, GAPS_OUT.bottom * 0.5 + BORDER),
  },
})
