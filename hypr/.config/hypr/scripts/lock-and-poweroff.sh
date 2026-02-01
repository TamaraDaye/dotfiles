#!/bin/bash

# Launch hyprlock in the background
hyprlock &

# Wait for 60 seconds
sleep 60

# Check if hyprlock is still running before turning off the display
if [ $(pidof hyprlock) ]; then
    # This command turns off ALL active monitors.
    hyprctl dispatch dpms off
fi