local MAIN_MOD = "SUPER"

-- stylua: ignore start
hl.bind(
  MAIN_MOD .. " + w",
  hl.dsp.window.close(),
  { description = "Close window" }
)

hl.bind(
  MAIN_MOD .. " + CTRL + w",
  hl.dsp.window.kill(),
  { description = "Hard close window" }
)

hl.bind(
  MAIN_MOD .. " + f",
  hl.dsp.window.fullscreen({ mode = "maximized" }),
  { description = "Miximize window" }
)

hl.bind(
  MAIN_MOD .. " + v",
  hl.dsp.window.float(),
  { description = "Toggle floating" }
)

local DIRECTIONS = {
  { key = "H", direction = "l" },
  { key = "J", direction = "d" },
  { key = "K", direction = "u" },
  { key = "L", direction = "r" },

  { key = "left", direction = "l" },
  { key = "down", direction = "d" },
  { key = "up", direction = "u" },
  { key = "right", direction = "r" },
}

for _, bind in pairs(DIRECTIONS) do
  hl.bind(
    MAIN_MOD .. " + " .. bind.key,
    hl.dsp.focus({ direction = bind.direction }),
    { description = "Focus " .. bind.direction }
  )

  hl.bind(
    MAIN_MOD .. " + SHIFT + " .. bind.key,
    hl.dsp.window.move({ direction = bind.direction }),
    { description = "Move window " .. bind.direction }
  )
end

hl.bind(
  MAIN_MOD .. " + mouse:272",
  hl.dsp.window.drag(),
  {
    mouse = true,
    description = "Move window with mouse",
  }
)

hl.bind(
  MAIN_MOD .. " + mouse:273",
  hl.dsp.window.resize(),
  {
    mouse = true,
    description = "Resize window with mouse"
  }
)

local RESIZE_STEP = 20

hl.bind(
  MAIN_MOD .. " + CTRL + h",
  hl.dsp.window.resize({
    x = -RESIZE_STEP,
    y = 0,
    relative = true,
  }),
  {
    repeating = true,
    description = "Resize window left",
  }
)

hl.bind(
  MAIN_MOD .. " + CTRL + j",
  hl.dsp.window.resize({
    x = 0,
    y = RESIZE_STEP,
    relative = true,
  }),
  {
    repeating = true,
    description = "Resize window down",
  }
)

hl.bind(
  MAIN_MOD .. " + CTRL + k",
  hl.dsp.window.resize({
    x = 0,
    y = -RESIZE_STEP,
    relative = true,
  }),
  {
    repeating = true,
    description = "Resize window up",
  }
)

hl.bind(
  MAIN_MOD .. " + CTRL + l",
  hl.dsp.window.resize({
    x = RESIZE_STEP,
    y = 0,
    relative = true,
  }),
  {
    repeating = true,
    description = "Resize window right",
  }
)
-- stylua: ignore end
