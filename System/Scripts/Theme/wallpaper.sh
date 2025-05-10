#!/usr/bin/env bash

WALLPAPER_DIR="/etc/nixos/System/Theme/Wallpapers"
CONFIG_FILE="/etc/nixos/System/Theme/stylix-wallpaper.nix"

echo "Checking if wallpaper directory exists: $WALLPAPER_DIR"
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "ERROR: Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

echo "Checking if Stylix config file exists: $CONFIG_FILE"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "ERROR: Stylix config file not found: $CONFIG_FILE"
    exit 1
fi

echo "Scanning available wallpapers..."
SELECTED_BASE=$(find "$WALLPAPER_DIR" -type f -exec basename {} \; | sed -E 's/\.(gif|png|jpe?g)$//' | sort -u | wofi --dmenu --prompt "Select a wallpaper")

if [ -z "$SELECTED_BASE" ]; then
    echo "No wallpaper selected. Exiting."
    exit 1
fi

echo "User selected base name: $SELECTED_BASE"

GIF_PATH="$WALLPAPER_DIR/$SELECTED_BASE.gif"
PNG_PATH="$WALLPAPER_DIR/$SELECTED_BASE.png"
JPG_PATH="$WALLPAPER_DIR/$SELECTED_BASE.jpg"
JPEG_PATH="$WALLPAPER_DIR/$SELECTED_BASE.jpeg"

# Determine if we're using a gif or static image
USE_GIF=false
if [ -f "$GIF_PATH" ]; then
    echo "Found GIF wallpaper: $GIF_PATH"
    USE_GIF=true
else
    if [ -f "$PNG_PATH" ]; then
        SELECTED_IMAGE="$PNG_PATH"
    elif [ -f "$JPG_PATH" ]; then
        SELECTED_IMAGE="$JPG_PATH"
    elif [ -f "$JPEG_PATH" ]; then
        SELECTED_IMAGE="$JPEG_PATH"
    else
        echo "No matching image file found for: $SELECTED_BASE"
        exit 1
    fi

    echo "Found static wallpaper: $SELECTED_IMAGE"
    echo "Checking if image file really exists..."
    if [ ! -f "$SELECTED_IMAGE" ]; then
        echo "ERROR: Selected image does not exist: $SELECTED_IMAGE"
        exit 1
    fi

    REAL_PATH=$(realpath "$SELECTED_IMAGE")
    echo "Resolved real path: $REAL_PATH"

    echo "Updating Stylix config to use builtins.path"
    sed -i "s|wallpaper = .*;|wallpaper = builtins.path { path = \"$REAL_PATH\"; name = \"wallpaper\"; };|" "$CONFIG_FILE"
fi

echo "Rebuilding NixOS configuration..."
sudo /run/current-system/sw/bin/nixos-rebuild switch --flake /etc/nixos/.#nixos --impure

# Only apply swww if GIF was selected
if [ "$USE_GIF" = true ]; then
    echo "Restarting swww-daemon for animated wallpaper..."
    pkill -x swww-daemon 2>/dev/null
    swww-daemon &
    sleep 1

    echo "Applying animated wallpaper via swww: $GIF_PATH"
    swww img "$GIF_PATH" --transition-type any
fi

echo "Done."

