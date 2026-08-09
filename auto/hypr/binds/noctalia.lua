local MAIN_MOD = "SUPER"
local IPC = "noctalia msg"

-- stylua: ignore start
hl.bind(
  MAIN_MOD .. " + comma",
  hl.dsp.exec_cmd(IPC .. " settings-toggle"),
  { description = "Toggle Noctalia settings" }
)

hl.bind(
  MAIN_MOD .. "+ space",
  hl.dsp.exec_cmd(
    "hyprctl -q switchxkblayout all 0 && " ..
    IPC .. " panel-toggle launcher"
  ),
  { description = "Toggle nocatalia launcher" }
)

hl.bind(
  MAIN_MOD .. " + s",
  hl.dsp.exec_cmd(IPC .. " panel-toggle control-center"),
  { description = "Toggle Noctalia control center" }
)

hl.bind(
  MAIN_MOD .. " + escape",
  hl.dsp.exec_cmd(IPC .. " panel-toggle session"),
  { description = "Toggle session menu" }
)

hl.bind(
  MAIN_MOD .. " + a",
  hl.dsp.exec_cmd(IPC .. " panel-toggle control-center audio"),
  { description = "Toggle audio menu" }
)

hl.bind(
  MAIN_MOD .. " + n",
  hl.dsp.exec_cmd(IPC .. " panel-toggle control-center notifications"),
  { description = "Toggle notification menu" }
)

hl.bind(
  MAIN_MOD .. " + CTRL + n",
  hl.dsp.exec_cmd(IPC .. " notification-clear-history"),
  { description = "Clear notification history" }
)

hl.bind(
  "print",
  hl.dsp.exec_cmd(IPC .. " screenshot-region"),
  { description = "Capture screen region" }
)

hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd(IPC .. " volume-up"),
  {
    repeating = true,
    locked = true,
    description = "Increase volume"
  }
)

hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd(IPC .. " volume-down"),
  {
    repeating = true,
    locked = true,
    description = "Decrease volume"
  }
)

hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd(IPC .. " volume-mute"),
  {
    locked = true,
    description = "Toggle audio mute"
  }
)

hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd(IPC .. " mic-mute"),
  {
    locked = true,
    description = "Toggle microphone mute",
  }
)

hl.bind(
  "XF86AudioPlay",
  hl.dsp.exec_cmd(IPC .. " media toggle"),
  {
    locked = true,
    description = "Play or pause media",
  }
)

hl.bind(
  "XF86AudioPrev",
  hl.dsp.exec_cmd(IPC .. " media previous"),
  {
    locked = true,
    description = "Previous media track",
  }
)

hl.bind(
  "XF86AudioNext",
  hl.dsp.exec_cmd(IPC .. " media next"),
  {
    locked = true,
    description = "Next media track",
  }
)

hl.bind(
  "XF86MonBrightnessUp",
  hl.dsp.exec_cmd(IPC .. " brightness-up"),
  {
    repeating = true,
    locked = true,
    description = "Increase brightness",
  }
)

hl.bind(
  "XF86MonBrightnessDown",
  hl.dsp.exec_cmd(IPC .. " brightness-down"),
  {
    repeating = true,
    locked = true,
    description = "Decrease brightness",
  }
)
-- stylua: ignore end
