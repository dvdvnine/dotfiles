hl.config({
  general = {
    layout = "dwindle",

    gaps_in = 6,
    gaps_out = 20,
  },

  layout = {
    single_window_aspect_ratio = { 1.84, 1 },
  },

  dwindle = {
    default_split_ratio = 1.22,

    preserve_split = true,
    force_split = 2,

    precise_mouse_move = true,
  },

  scrolling = {
    column_width = 0.68,

    fullscreen_on_one_column = false,
  },
})
