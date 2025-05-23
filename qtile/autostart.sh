#!/bin/bash

# Start picom
picom &

# Start redshift
redshift &

# Disable the bell
xset -b &

nm-applet &

blueman-applet &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# Run the random wallpaper script
python ~/.config/qtile/random_wallpaper.py &
# nitrogen --set-scaled ~/Pictures/red_and_grey.jpg

# Start xss-lock with i3lock
# xss-lock -- i3lock -c 000000 -e &

# Set initial screen saver and DPMS settings
xset s 300 5
xset dpms 600 900 1200

# Start media check script in the background
~/.config/qtile/media-check.sh &
