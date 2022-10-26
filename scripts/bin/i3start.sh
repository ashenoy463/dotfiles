#!/bin/sh
# Get variables
. ~/.profile

# Get colors from override theme and set wallpaper OR get colors from wallpaper
wal --theme $RICE_THEME && feh --bg-scale $RICE_WALLPAPER && notify-send -u low "Gibraltar Notification" "Wallpaper set with override theme" || wal -i $RICE_WALLPAPER && notify-send -u low "Gibraltar Notification" "Wallpaper set with generated theme"
# Update Discord theme
pywal-discord

# Install template-generated config files
mv $HOME/.cache/wal/dunstrc $HOME/.config/dunst/dunstrc
mv $HOME/.cache/wal/betterlockscreenrc $HOME/.config/betterlockscreenrc

# Restart Processes
pkill dunst; dunst &
pkill picom; picom -b --config $CONF_PICOM &

# Update lockscreen image
betterlockscreen -u $RICE_WALLPAPER && notify-send -u low "Gibraltar Notification" "Lockscreen image updated"
