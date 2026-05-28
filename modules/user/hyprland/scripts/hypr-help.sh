SUBMAP="${1:-}"

hyprctl binds -j | jq -r --arg s "$SUBMAP" '
  .[] | select(.submap == $s) |
  (
    [
      if (.modmask / 64 | floor) % 2 == 1 then "SUPER" else empty end,
      if (.modmask / 8  | floor) % 2 == 1 then "ALT"   else empty end,
      if (.modmask / 4  | floor) % 2 == 1 then "CTRL"  else empty end,
      if  .modmask % 2             == 1 then "SHIFT" else empty end
    ] | join("+")
  ) as $mods |
  (if $mods != "" then $mods + "+" else "" end) + .key +
  "  →  " + .dispatcher +
  (if .arg != "" then "  " + .arg else "" end)
' | rofi -dmenu -p "${SUBMAP:-global}" -i -l 20 || true
