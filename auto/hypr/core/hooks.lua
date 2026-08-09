hl.on("hyprland.start", function()
  hl.exec_cmd("uwsm-app -- noctalia")
  hl.exec_cmd("uwsm-app -- hyprland-per-window-layout")

  hl.exec_cmd("uwsm-app -- Throne.desktop")
  hl.exec_cmd("uwsm-app -- org.telegram.desktop.desktop", { no_initial_focus = true })
  hl.exec_cmd("uwsm-app -- com.discordapp.Discord.desktop", { no_initial_focus = true })

  hl.exec_cmd("uwsm-app -- brave-browser.desktop", { workspace = "1" })
end)
