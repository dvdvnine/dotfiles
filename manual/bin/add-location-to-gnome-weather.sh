#!/bin/bash
#
# Add a custom location to GNOME Weather.

set -euo pipefail

die() {
  echo "❌ $*" >&2
  exit 1
}

main() {
  command -v curl >/dev/null || die 'curl is required.'
  command -v jq >/dev/null || die 'jq is required.'

  echo '🌦️  Where should the location be added?'
  echo '  1) System GNOME Weather'
  echo '  2) Flatpak GNOME Weather'
  echo

  local target
  read -r -p 'Choose [1/2]: ' target
  echo

  local -a gsettings_cmd
  case "${target}" in
  1)
    command -v gnome-weather >/dev/null ||
      die 'System GNOME Weather is not installed.'
    gsettings_cmd=(gsettings)
    ;;
  2)
    if ! command -v flatpak >/dev/null ||
      ! flatpak info org.gnome.Weather >/dev/null 2>&1; then
      die 'Flatpak GNOME Weather is not installed.'
    fi
    gsettings_cmd=(flatpak run --command=gsettings org.gnome.Weather)
    ;;
  *)
    die 'Choose 1 or 2.'
    ;;
  esac

  local query
  if (($# > 0)); then
    query="$*"
  else
    read -r -p '🔎 Location to add: ' query
  fi
  [[ -n "${query}" ]] || die 'Location cannot be empty.'

  local language="${LANG:-en}"
  language="${language%%[_@.]*}"

  local response
  response="$(
    curl --fail --silent --show-error --get \
      'https://nominatim.openstreetmap.org/search' \
      --data-urlencode "q=${query}" \
      --data 'format=jsonv2' \
      --data 'limit=1' \
      --header "Accept-Language: ${language}" \
      --user-agent "${0##*/}"
  )"

  jq -e '.[0]' >/dev/null <<<"${response}" ||
    die 'No locations found. Try a more specific query.'

  local display_name
  display_name="$(jq -r '.[0].display_name' <<<"${response}")"

  echo "📍 Found: ${display_name}"
  echo '   Search data: © OpenStreetMap contributors'
  echo

  local answer
  read -r -p 'Add this location? [y/N]: ' answer
  echo
  case "${answer,,}" in
  y | yes) ;;
  *)
    echo '🚫 Nothing changed.'
    exit 0
    ;;
  esac

  local -a place
  readarray -t place < <(
    jq -r '
      .[0] |
      [
        (.name // (.display_name | split(",")[0])),
        (.lat | tonumber * 0.017453292519943295),
        (.lon | tonumber * 0.017453292519943295)
      ] | .[]
    ' <<<"${response}"
  )

  local name="${place[0]}"
  local lat="${place[1]}"
  local lon="${place[2]}"

  # Escape characters significant inside a single-quoted GVariant string.
  name="${name//\\/\\\\}"
  name="${name//\'/\\\'}"

  local location
  location="<(uint32 2, <('${name}', '', false, @a(dd) [(${lat}, ${lon})], @a(dd) [])>)>"

  local locations
  locations="$("${gsettings_cmd[@]}" get org.gnome.Weather locations)"

  if [[ "${locations}" == '@av []' ]]; then
    locations="[${location}]"
  else
    locations="${locations%]}, ${location}]"
  fi

  "${gsettings_cmd[@]}" set \
    org.gnome.Weather locations "${locations}"

  echo "✅ Added: ${display_name}"
}

main "$@"
