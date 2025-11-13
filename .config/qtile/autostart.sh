#!/bin/bash

# Start picom
picom &

# Start redshift
redshift &

# Disable the bell
xset -b &

polybar &

nm-applet &

blueman-applet &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Run the random wallpaper script
python ~/.config/qtile/random_wallpaper.py &
