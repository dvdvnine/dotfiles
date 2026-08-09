#!/usr/bin/env bash
set -euo pipefail

# Expects **the name of an existing controller** and
# returns a list of active devices with battery level indicators.

# TODO: switch to python + dbus-monitor (??).

readonly INACTIVE_COLOR="#7f849c"

readonly INFO_COLOR="#98c379"
readonly WARNING_COLOR="#c9b03e"
readonly CRITICAL_COLOR="#f38ba8"

readonly LABEL="<span size='5.5pt'>BLUETOOTH</span>"

declare -rA ICONS=(
  [audio-card]=""
  [audio-headset]=""
  [audio-headphones]=""
  [input-mouse]=""
  [input-gaming]="󰊴"
  [input-keyboard]=""
  [input-tablet]="󰓷"
  [computer]=""
  [video-display]=""
  [printer]="󰐪"
  [scanner]="󰚫"
  [phone]=""
  [modem]="󰒍"
  [camera-photo]=""
  [camera-video]=""
  [multimedia-player]="󰐊"
  [network-wireless]="󰀂"
  [unknown]="󰂯"
)

get_property() {
  busctl get-property org.bluez "$@"
}

is_true() {
  local value
  value="$(busctl get-property org.bluez "$@")"
  [[ "${value}" == "b true" ]]
}

get_battery_color() {
  local -r charge="$1"

  local color="${WARNING_COLOR}"

  if [[ "$charge" =~ ^[0-9]+$ ]]; then
    if ((10#$charge >= 50)); then
      color="${INFO_COLOR}"
    elif ((10#$charge >= 20)); then
      color="${WARNING_COLOR}"
    else
      color="${CRITICAL_COLOR}"
    fi
  fi

  printf '%s' "${color}"
}

main() {
  local -r controller_path="/org/bluez/$1"

  # Check that the controller exists.
  if ! busctl tree --list org.bluez | grep -Fxq "$controller_path"; then
    return 1
  fi

  # Controller is disabled = module inactive.
  if ! is_true "${controller_path}" org.bluez.Adapter1 Powered; then
    jq -cn \
      --arg color "${INACTIVE_COLOR}" \
      --arg label "${LABEL}" \
      --arg state "-" \
      '{text: "<span color=\"\($color)\">\($label)\n\($state)</span>"}'
    return 0
  fi

  # Build an array of icons and battery levels for active devices.
  local -a devices=()

  mapfile -t devices < <(
    busctl tree --list org.bluez |
      grep -Ex "${controller_path}/dev_([[:xdigit:]]{2}_){5}[[:xdigit:]]{2}" |
      while IFS= read -r device_path; do
        if is_true "${device_path}" org.bluez.Device1 Connected; then

          local type
          type="$(get_property "${device_path}" org.bluez.Device1 Icon | cut -d '"' -f2)"

          local charge
          charge="$(get_property "${device_path}" org.bluez.Battery1 Percentage | cut -d ' ' -f2 || true)"

          printf '%s %s\n' "${ICONS[$type]}" "${charge:-??}"
        fi
      done
  )

  local state

  case "${#devices[@]}" in
  0) state="-" ;;
  1)
    read -r icon charge <<<"${devices[0]}"

    local color
    color="$(get_battery_color "${charge}")"

    state="<span color='${color}'>${icon} ${charge}%</span>"
    ;;
  *)
    # Plain ASCII spaces are unreliable in pango markup.
    local -r separator="&#8194;"

    for device in "${devices[@]}"; do
      read -r icon charge <<<"${device}"

      local color
      color="$(get_battery_color "${charge}")"

      state+="<span color='${color}'>${icon}</span>${separator}"
    done

    state="${state%"${separator}"}"
    ;;
  esac

  jq -cn \
    --arg label "${LABEL}" \
    --arg state "${state}" \
    '{text: ($label + "\n" + $state)}'
}

main "$@"
