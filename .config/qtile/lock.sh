#!/usr/bin/env bash
set -euo pipefail

IMG="/tmp/i3lock_screen.png"

# 1) Screenshot
scrot "$IMG"

# 2) Blur + overlay time/date/greeter
#    (positions roughly match your Hyprlock layout)
convert "$IMG" -blur 0x8 \
  -gravity center \
  -fill "rgba(255,255,255,1.0)"  -pointsize 84  -annotate +0-220 "$(date '+%H:%M')" \
  -fill "rgba(255,255,255,0.9)"  -pointsize 32  -annotate +0-140  "$(LC_TIME=en_US.UTF-8 date '+%A, %d %b')" \
  "$IMG"

# 3) Lock with vanilla i3lock
# -e = ignore empty password (similar to your ignore_empty_input)
i3lock -i "$IMG" -e

# Optional: clean up after unlock (leave the image during lock to avoid issues)
rm -f "$IMG"

