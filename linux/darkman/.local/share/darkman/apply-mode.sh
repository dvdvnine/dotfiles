#!/bin/bash
# This script switches themes and wallpapers when the theme mode changes (for `darkman`).
# REQUIRES: `darkman`, `awww`, `qt5ct` or `qt5ct-kde`, `qt6ct` or `qt6ct-kde`.

set -euo pipefail

readonly WALLPAPERS_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/backgrounds"
readonly QT6_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/qt6/qt6.conf"
readonly QT5_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/qt5/qt5.conf"


set_gtk_theme() {
  local gtk3_theme=$1
  local gtk4_theme=$2
  local icons=$3

  gsettings set org.gnome.desktop.interface gtk-theme "$gtk3_theme"
  gsettings set org.gnome.desktop.interface color-scheme "$gtk4_theme"
  gsettings set org.gnome.desktop.interface icon-theme "$icons"
}

set_qt_theme() {
  local qt_style=$1
  local qt_scheme=$2
  local icons=$3

  local config

  for config in "$QT5_CONFIG" "$QT6_CONFIG"; do
    sed -Ei "s|^(style[[:space:]]*=[[:space:]]*).*$|\1${qt_style}|" "$config"
    sed -Ei "s|^(color_scheme_path[[:space:]]*=[[:space:]]*).*$|\1${qt_scheme}.colors|" "$config"
    sed -Ei "s|^(icon_theme[[:space:]]*=[[:space:]]*).*$|\1${icons}|" "$config"
  done
}

set_wallpaper() {
  local wallpaper="$1"
  shift

  awww img "$@" "$wallpaper"
}

main() {
  local -a animation_args=(
    --transition-type wipe
    --transition-angle 30
    --transition-step 90
  )

  case "${1:-}" in
    dark)
      set_gtk_theme "adw-gtk3-dark" "prefer-dark" "Papirus-Dark"
      set_qt_theme "breeze" "/usr/share/color-schemes/BreezeDark" "Papirus-Dark"
      set_wallpaper "$WALLPAPERS_PATH/019c1c83-d32e-78cb-b601-b6cc7f1df384_219.jpg" "${animation_args[@]}"
      ;;
    light)
      set_gtk_theme "adw-gtk3" "prefer-light" "Papirus-Light"
      set_qt_theme "breeze" "/usr/share/color-schemes/BreezeLight" "Papirus-Light"
      set_wallpaper "$WALLPAPERS_PATH/019c1ca0-f1bd-7839-bf87-267b15ee1c51_169.jpg" "${animation_args[@]}"
      ;;
    *)
      return 1
      ;;
  esac
}


main "$@"
