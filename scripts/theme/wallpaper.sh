#!/usr/bin/env bash

# Directory containing wallpapers
WALLPAPER_DIR="/home/eren/Pictures/wallpapers"

# Path to the stylix configuration file
CONFIG_FILE="/etc/nixos/System/Theme/stylix-wallpaper.nix"

# Use wofi to select a wallpaper
SELECTED_WALLPAPER=$(ls "$WALLPAPER_DIR" | wofi --dmenu --prompt "Select a wallpaper")

# Check if a wallpaper was selected
if [ -z "$SELECTED_WALLPAPER" ]; then
    echo "No wallpaper selected. Exiting."
    exit 1
fi

# Full path of the selected wallpaper
FULL_PATH="$WALLPAPER_DIR/$SELECTED_WALLPAPER"

# Update the stylix configuration file
sed -i "s|wallpaper = .*;|wallpaper = $FULL_PATH;|" "$CONFIG_FILE"

# Rebuild and apply NixOS configuration
echo "Rebuilding NixOS configuration..."
sudo /run/current-system/sw/bin/nixos-rebuild switch --flake /etc/nixos/.#nixos --impure

swww kill

swww-daemon &

# Restart swww to apply the new wallpaper
echo "Applying new wallpaper with swww..."
swww img "$FULL_PATH"
sleep 2
swww img "$FULL_PATH" 

