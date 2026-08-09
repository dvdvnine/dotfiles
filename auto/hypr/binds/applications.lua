local MAIN_MOD = "SUPER"

-- stylua: ignore start
hl.bind(
  MAIN_MOD .. " + return",
  hl.dsp.exec_cmd("ghostty +new-window"), -- connects to the running "Ghostty" instance via D-Bus
  { description = "Open terminal" }
)

hl.bind(
  MAIN_MOD .. " + e",
  hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window"),
  { description = "Open new file manager window" }
)
-- stylua: ignore end
