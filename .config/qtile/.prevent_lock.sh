#!/bin/bash

# Disable screensaver and screen blanking
xset s off
xset -dpms

# Monitor for media players
while true; do
    if playerctl status | grep -q 'Playing'; then
        xset s off
        xset -dpms
    else
        xset s on
        xset +dpms
    fi
    sleep 60
done

