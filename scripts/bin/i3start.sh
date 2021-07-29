#!/bin/sh
# Get variables
. ~/.profile

# Kill processes
pkill picom
pkill dunst

# Get colors from override theme and set wallpaper OR get colors from wallpaper
wal --theme $RICE_THEME && feh --bg-scale $RICE_WALLPAPER && notify-send -u low "Gibraltar Notification" "Wallpaper set with override theme" || wal -i $RICE_WALLPAPER && notify-send -u "Gibraltar Notification" "Wallpaper set with generated theme"
# Update Discord theme
pywal-discord

# Install template-generated config files
mv $HOME/.cache/wal/dunstrc $HOME/.config/dunst/dunstrc
mv $HOME/.cache/wal/betterlockscreenrc $HOME/.config/betterlockscreenrc

# Restart processes
picom -b --config $CONF_PICOM
dunst &

# Update lockscreen image
betterlockscreen -u $RICE_WALLPAPER && notify-send -u low "Gibraltar Notifiation" "Lockscreen image updated"
