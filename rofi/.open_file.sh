#!/bin/bash

# Base directory to start from
BASE_DIR="$HOME"

# Function to list files and directories
list_files() {
    local DIR="$1"
    echo ".."
    find "$DIR" -maxdepth 1 -mindepth 1 ! -name ".*" -printf "%P\n"
}

# Initial directory
CURRENT_DIR="$BASE_DIR"

while true; do
    # List files and directories, including a ".." option to go up
    SELECTION=$(list_files "$CURRENT_DIR" | rofi -dmenu -i -p "Select a file or directory:")

    # Exit if no selection is made
    [ -z "$SELECTION" ] && exit 0

    # Handle the ".." option to go back
    if [ "$SELECTION" == ".." ]; then
        if [ "$CURRENT_DIR" != "$BASE_DIR" ]; then
            CURRENT_DIR=$(dirname "$CURRENT_DIR")
        fi
    else
        # Construct the full path of the selected item
        SELECTED_PATH="$CURRENT_DIR/$SELECTION"

        # Check if the selected item is a directory
        if [ -d "$SELECTED_PATH" ]; then
            # Update the current directory to the selected directory
            CURRENT_DIR="$SELECTED_PATH"
        else
            # Open the selected file
            xdg-open "$SELECTED_PATH"
            exit 0
        fi
    fi
done

