# Get the current status of the player
status=$(playerctl status 2>/dev/null)

# Get artist and title information
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [ ${#artist} -gt 30 ]; then
    artist="${artist:0:13}..."
else
    artist="$artist"
fi

if [ ${#title} -gt 30 ]; then
    title="${title:0:27}..."
else
    title="$title"
fi

# Determine the icon and status to show
if [ "$status" = "Playing" ]; then
    icon="" # Play icon
elif [ "$status" = "Paused" ]; then
    icon="" # Pause icon
else
    icon="" # Stop icon
fi

# Format the output
if [ -n "$artist" ] && [ -n "$title" ]; then
    echo "$icon $artist - $title"
else
    echo "No Media"
fi
