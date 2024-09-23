#!/bin/sh
# Start picom
picom &

# Start redshift
redshift &

# Disable the bell
xset -b &

# Run the random wallpaper script
python ~/.config/qtile/random_wallpaper.py &

# Start xss-lock with i3lock
xss-lock -- i3lock -c 000000 -e &

# Set initial screen saver and DPMS settings
xset s 300 5
xset dpms 600 900 1200

# Start media check script in the background
~/.config/qtile/media-check.sh &

