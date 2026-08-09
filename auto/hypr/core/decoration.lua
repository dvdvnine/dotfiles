hl.config({
  general = {
    border_size = 4,

    col = {
      active_border = "rgba(50,165,200,0.8)",
      inactive_border = "rgba(127,132,156,0.4)",
    },
  },

  decoration = {
    rounding = 0,
    rounding_power = 2,

    blur = {
      enabled = false,

      special = false,
      xray = true,

      size = 3,
      passes = 2,

      brightness = 0.5,
      contrast = 0.75,
      noise = 0.05,
      vibrancy = 0.1,
      vibrancy_darkness = 0.6,
    },

    shadow = {
      enabled = false,

      range = 4,
      render_power = 2,

      color = "rgba(0,0,0,0.6)",
    },
  },
})
