#!/bin/bash

# Function to set DPMS and screensaver settings based on media status
set_dpms() {
    if playerctl status | grep -q "Playing"; then
        # Media is playing, disable DPMS and screen saver
        xset s off -dpms
        echo "Timer Set Off! Media Playing"
    else
        # No media playing, enable DPMS and screen saver
        xset s 300 5
        xset dpms 600 900 1200
        echo "Timer Reset! No Media Playing"
    fi
}

# Function to execute the file
execute_file() {
    # Replace this with the file you want to execute
    /usr/local/bin/lock.sh
    echo "Executed the file: $(date)"
}

# Monitor media player status and adjust DPMS settings, and execute file after 5 minutes of inactivity
while true; do
    set_dpms

    # Check for inactivity and media status
    if [ "$(xprintidle)" -ge 300000 ] && ! playerctl status | grep -q "Playing"; then
        execute_file
    fi

    sleep 10
done

