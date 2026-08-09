local MAIN_MOD = "SUPER"

for target = 1, 3 do
  hl.bind(
    MAIN_MOD .. " + " .. target,
    hl.dsp.focus({ workspace = target }),
    { description = "Switch to workspace " .. target }
  )

  hl.bind(
    MAIN_MOD .. " + SHIFT + " .. target,
    hl.dsp.window.move({
      workspace = target,
      follow = false,
    }),
    { description = "Move window to workspace " .. target }
  )
end

local SPECIAL_WORKSPACES = {
  { name = "terminal", key = "grave" },
  { name = "scratchpad", key = "tab" },
  { name = "game", key = "p" },
}

for _, workspace in ipairs(SPECIAL_WORKSPACES) do
  hl.bind(
    MAIN_MOD .. " + " .. workspace.key,
    hl.dsp.workspace.toggle_special(workspace.name),
    { description = "Toggle " .. workspace.name .. " special workspace" }
  )

  hl.bind(
    MAIN_MOD .. " + SHIFT + " .. workspace.key,
    hl.dsp.window.move({
      workspace = "special:" .. workspace.name,
      follow = false,
    }),
    { description = "Move active window to " .. workspace.name .. " special workspace" }
  )
end
