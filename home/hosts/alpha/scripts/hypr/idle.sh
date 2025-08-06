#!/bin/sh

# Check if Discord is in a call
in_discord_call=$(pactl list sink-inputs | grep -i 'discord' | grep -i 'audio' | grep -q 'RUNNING'; echo $?)

# Check if media is playing
media_playing=$(playerctl status 2>/dev/null | grep -q 'Playing'; echo $?)

# If neither is active, lock
if [[ $in_discord_call -ne 0 && $media_playing -ne 0 ]]; then
    hyprlock
fi
