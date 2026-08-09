local SPACENAME = "special:scratchpad"

local BAR_H = 34

local BORDER = hl.get_config("general.border_size")
local GAPS_OUT = hl.get_config("general.gaps_out")
local GAPS_IN = hl.get_config("general.gaps_in")

-- NOTE: changing values in the main space config may break the layout.
local LOCAL_GAPS_OUT = {}
for side, value in pairs(GAPS_OUT) do
  LOCAL_GAPS_OUT[side] = value * 2
end

-- stylua: ignore
local AVAILABLE_H = string.format(
  "(monitor_h-%d-%d)",
  BAR_H,
  LOCAL_GAPS_OUT.top + BORDER + LOCAL_GAPS_OUT.bottom + BORDER
)

local DISCORD_W = 1030
local DISCORD_H = string.format("%s*0.8", AVAILABLE_H)

hl.window_rule({
  match = { class = "(?i)^((com.discordapp.)?discord|vesktop)$" },

  workspace = SPACENAME,
  float = true,
  size = { DISCORD_W, DISCORD_H },
  move = {
    LOCAL_GAPS_OUT.left + BORDER,
    string.format("%d+%d+(%s-%s)*0.5", BAR_H, LOCAL_GAPS_OUT.top + BORDER, AVAILABLE_H, DISCORD_H),
  },
})

local TELEGRAM_H = string.format("%s*1", AVAILABLE_H)

hl.window_rule({
  match = { class = "^org.telegram.desktop$" },

  workspace = SPACENAME,
  float = true,
  size = { 710, TELEGRAM_H },
  move = {
    LOCAL_GAPS_OUT.left + BORDER + DISCORD_W + BORDER + GAPS_IN.right + GAPS_IN.left + BORDER,
    string.format("%d+%d+(%s-%s)*0.5", BAR_H, LOCAL_GAPS_OUT.top + BORDER, AVAILABLE_H, TELEGRAM_H),
  },

  focus_on_activate = false,
  no_screen_share = true,
  no_blur = true,
})

local POMODORO_W = 440
local POMODORO_H = 340

hl.window_rule({
  match = { class = "^org.gnome.Solanum$" },

  workspace = SPACENAME,
  float = true,
  size = { POMODORO_W, POMODORO_H },
  move = {
    string.format("monitor_w-%s-%s", POMODORO_W, GAPS_OUT.right * 0.5 + BORDER),
    string.format("monitor_h-%s-%s", POMODORO_H, GAPS_OUT.bottom * 0.5 + BORDER),
  },
})

hl.window_rule({
  match = { class = "^KeePassXC$" },

  workspace = SPACENAME,

  no_screen_share = true,
})

hl.window_rule({
  match = { class = "^io.bassi.Amberol$" },

  workspace = SPACENAME,
})
