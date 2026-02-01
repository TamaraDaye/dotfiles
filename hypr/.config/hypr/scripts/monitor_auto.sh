#!/bin/bash

# Variable to store previous state to avoid spamming commands
last_state="unknown"

while true; do
    # 1. Check if DP-3 is connected (Returns "connected" or "disconnected")
    # Adjust 'card*-DP-3' if your folder name is slightly different in /sys/class/drm/
    current_status=$(cat /sys/class/drm/card*-DP-3/status 2>/dev/null)

    # 2. Determine mode based on connection
    if [[ "$current_status" == *"connected"* ]]; then
        new_state="docked"
    else
        new_state="mobile"
    fi

    # 3. Only run commands if the state actually CHANGED
    if [ "$new_state" != "$last_state" ]; then
        echo "Switching to $new_state mode..."

        if [ "$new_state" == "docked" ]; then
            # DOCKED MODE:
            # 1. Disable laptop to save power/confusion
            hyprctl keyword monitor "eDP-1, disable"
            # 2. Wait 1s for laptop to turn off
            sleep 1
            # 3. Force External Monitor to 8-bit Safe Mode
            hyprctl keyword monitor "DP-3, preferred, auto, 1, bitdepth, 8"
        else
            # MOBILE MODE:
            # 1. Turn Laptop back on
            hyprctl keyword monitor "eDP-1, preferred, auto, 1.6"
        fi

        # Update state so we don't loop forever
        last_state="$new_state"
    fi

    # Wait 1 second before checking again
    sleep 1
done
