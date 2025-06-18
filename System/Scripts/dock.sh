#!/usr/bin/env zsh

# This script toggles the nwg-dock-hyprland program.

if pgrep -f "nwg-dock-hyprland" > /dev/null
then
    # If the process is running, kill it.
    pkill -f "nwg-dock-hyprland"
    echo "nwg-dock-hyprland has been stopped."
else
    # If the process is not running, start it in the background.
    nwg-dock-hyprland &
    echo "nwg-dock-hyprland has been started."
fi
