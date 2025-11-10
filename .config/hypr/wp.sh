#!/bin/sh

WALLPAPER_DIR="$HOME/Pictures/rose-pine"

# Get the current wallpaper path from swww
CURRENT_WALL=$(swww query | grep 'image:' | awk -F'image: ' '{print $2}' | xargs basename)

# Pick a random wallpaper that isn't the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$CURRENT_WALL" | shuf -n 1)

# Set the wallpaper with a transition (optional)
swww img "$WALLPAPER" --transition-type none
