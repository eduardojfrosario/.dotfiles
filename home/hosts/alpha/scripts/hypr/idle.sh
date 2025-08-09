#!/bin/sh

# Check if Discord is in a call
in_discord_call=$(pactl list sink-inputs | grep -i 'discord' | grep -i 'audio' | grep -q 'RUNNING'; echo $?)

# Check if media is playing (general check)
media_playing=$(playerctl status 2>/dev/null | grep -q 'Playing'; echo $?)

# Check specifically if Spotify is playing
spotify_playing=$(playerctl --player=spotify status 2>/dev/null | grep -q 'Playing'; echo $?)

# If none are active (Discord call, general media, or Spotify), lock
if [[ $in_discord_call -ne 0 && $media_playing -ne 0 && $spotify_playing -ne 0 ]]; then
    systemctl suspend
    hyprlock
fi
