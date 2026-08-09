#!/usr/bin/env bash
set -euo pipefail

# DND indicator for 'mako'.

if makoctl mode | grep -Fxq "do-not-disturb"; then
  jq -nc \
    --arg text "<span color='#c9b03e'>true</span>" \
    '{text: $text}'
else
  jq -nc \
    --arg text "false" \
    '{text: $text}'
fi
