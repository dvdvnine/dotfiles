hl.config({
  animations = {
    enabled = true,
  },
})

-- Curves from Hyprland's default configuration.
hl.curve("easeOutQuint", {
  type = "bezier",
  points = { { 0.23, 1 }, { 0.32, 1 } },
})
hl.curve("easeInOutCubic", {
  type = "bezier",
  points = { { 0.65, 0.05 }, { 0.36, 1 } },
})
hl.curve("linear", {
  type = "bezier",
  points = { { 0, 0 }, { 1, 1 } },
})
hl.curve("almostLinear", {
  type = "bezier",
  points = { { 0.5, 0.5 }, { 0.75, 1 } },
})
hl.curve("quick", {
  type = "bezier",
  points = { { 0.15, 0 }, { 0.1, 1 } },
})

-- Hyprland's default spring with near-critical damping to suppress visible bounce.
hl.curve("easy", {
  type = "spring",
  mass = 1,
  stiffness = 238.1191,
  dampening = 30.5,
})

-- Hyprland's default animation profile with all durations reduced by 25%.
hl.animation({ leaf = "global", enabled = true, speed = 7.5, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 4.0425, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.5925, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.075, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.1175, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.2975, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.095, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.2725, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 2.8575, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.125, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.3425, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.0425, bezier = "almostLinear" })

-- macOS-like Spaces transition: both desktops slide as one horizontal plane in 375 ms.
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.75, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3.75, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3.75, bezier = "easeInOutCubic", style = "slide" })

-- Keep Hyprland's default fade style for special workspaces instead of the slide above.
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.455, bezier = "almostLinear", style = "fade" })

hl.animation({ leaf = "zoomFactor", enabled = true, speed = 5.25, bezier = "quick" })
