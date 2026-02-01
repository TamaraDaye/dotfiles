#!/bin/bash
# Force laptop display toggle - handles power-off scenarios

# Configuration
LAPTOP_DISPLAY="eDP-1"
LAPTOP_MODE="2560x1600@240.00"
LAPTOP_POS="0x0" 
LAPTOP_SCALE="1.0"

echo "Checking display status after potential power change..."

# Get all monitors (including disabled ones)
all_monitors=$(hyprctl monitors | awk '/Monitor/ {print $2}')
echo "All detected monitors: $all_monitors"

# Get only active/enabled monitors
active_monitors=$(hyprctl monitors -j 2>/dev/null | jq -r '.[] | select(.disabled == false) | .name' 2>/dev/null)
if [ $? -ne 0 ] || [ -z "$active_monitors" ]; then
    active_monitors=$(hyprctl monitors | grep -v "disabled: true" | awk '/Monitor/ {print $2}')
fi
echo "Currently active monitors: $active_monitors"

# Check if laptop is in active monitors
laptop_active=$(echo "$active_monitors" | grep -c "$LAPTOP_DISPLAY")

# Force enable laptop display if:
# 1. It's not in active monitors, OR
# 2. There are no active monitors at all (power outage scenario), OR  
# 3. Script was called with "force" argument
if [ "$laptop_active" -eq 0 ] || [ -z "$active_monitors" ] || [ "$1" = "force" ]; then
    echo "Forcing laptop display ON..."
    
    # Multiple enable attempts with different methods
    echo "Attempt 1: Standard enable with full config..."
    hyprctl keyword monitor "$LAPTOP_DISPLAY,$LAPTOP_MODE,$LAPTOP_POS,$LAPTOP_SCALE"
    sleep 1
    
    # Check if it worked
    if ! hyprctl monitors | grep -q "Monitor $LAPTOP_DISPLAY" || hyprctl monitors | grep -A 5 "Monitor $LAPTOP_DISPLAY" | grep -q "disabled: true"; then
        echo "Attempt 2: Enable then configure..."
        hyprctl keyword monitor "$LAPTOP_DISPLAY,enable"
        sleep 0.5
        hyprctl keyword monitor "$LAPTOP_DISPLAY,$LAPTOP_MODE,$LAPTOP_POS,$LAPTOP_SCALE"
        sleep 1
    fi
    
    # Still not working? Try preferred mode
    if ! hyprctl monitors | grep -q "Monitor $LAPTOP_DISPLAY" || hyprctl monitors | grep -A 5 "Monitor $LAPTOP_DISPLAY" | grep -q "disabled: true"; then
        echo "Attempt 3: Preferred mode..."
        hyprctl keyword monitor "$LAPTOP_DISPLAY,preferred,auto,1"
        sleep 1
    fi
    
    # Nuclear option: reload monitor config
    if ! hyprctl monitors | grep -q "Monitor $LAPTOP_DISPLAY" || hyprctl monitors | grep -A 5 "Monitor $LAPTOP_DISPLAY" | grep -q "disabled: true"; then
        echo "Attempt 4: Force reload monitors..."
        hyprctl reload
        sleep 2
        hyprctl keyword monitor "$LAPTOP_DISPLAY,$LAPTOP_MODE,$LAPTOP_POS,$LAPTOP_SCALE"
        sleep 1
    fi
    
    # Turn on display power management 
    echo "Ensuring display power is on..."
    hyprctl dispatch dpms on
    
    # Verify final state
    if hyprctl monitors | grep -q "Monitor $LAPTOP_DISPLAY" && ! hyprctl monitors | grep -A 5 "Monitor $LAPTOP_DISPLAY" | grep -q "disabled: true"; then
        notify-send "Display" "Laptop display enabled" -i display
        echo "✓ Laptop display successfully enabled"
        
        # Focus the laptop and move workspace to it
        hyprctl dispatch focusmonitor "$LAPTOP_DISPLAY" 2>/dev/null
        hyprctl dispatch moveworkspacetomonitor 1 "$LAPTOP_DISPLAY" 2>/dev/null
        
        # Turn off any external monitors that might be powered off
        for monitor in $(echo "$all_monitors" | grep -v "$LAPTOP_DISPLAY"); do
            if ! echo "$active_monitors" | grep -q "$monitor"; then
                echo "Disabling potentially dead monitor: $monitor"
                hyprctl keyword monitor "$monitor,disable" 2>/dev/null
            fi
        done
        
    else
        notify-send "Display" "Failed to enable laptop display" -i error
        echo "✗ Failed to enable laptop display"
        echo "Debug info:"
        hyprctl monitors | grep -A 10 "$LAPTOP_DISPLAY"
    fi
    
else
    echo "Laptop display is active, disabling..."
    hyprctl keyword monitor "$LAPTOP_DISPLAY,disable"
    
    # Verify disable worked
    sleep 0.5
    if hyprctl monitors | grep -A 5 "Monitor $LAPTOP_DISPLAY" | grep -q "disabled: true" || ! hyprctl monitors | grep -q "Monitor $LAPTOP_DISPLAY"; then
        notify-send "Display" "Laptop display disabled" -i display
        echo "✓ Laptop display disabled"
    else
        notify-send "Display" "Failed to disable laptop display" -i error
        echo "✗ Failed to disable laptop display"
    fi
fi

echo ""
echo "=== Final Status ==="
hyprctl monitors
