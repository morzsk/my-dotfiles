#!/usr/bin/env bash

until systemctl --user is-active --quiet awww.service; do
  sleep 1
done

while true; do
  find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) \
    | shuf \
    | while read -r img; do
        awww img "$img" --transition-type random --transition-angle 270 --transition-fps 60
        sleep 300
      done
done
