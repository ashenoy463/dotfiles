#!/bin/sh
# Get variables
. ~/.profile

# Start compositor
pkill picom
picom -b

# Get colors from override theme and set wallpaper OR get colors from wallpaper
wal --theme $RICE_THEME && feh --bg-scale $RICE_WALLPAPER || wal -i $RICE_WALLPAPER

# Update Discord theme
pywal-discord
# Update Firefox theme
pywalfox update

# Restart notification daemon
pkill dunst; dunst &

# Launch polybar
~/.config/polybar/colorblocks/launch.sh &

# Update lockscreen image
betterlockscreen -u $RICE_WALLPAPER

# Send notification
notify-send -u low "[Gibraltar]" "Initialization complete"


