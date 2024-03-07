#!/bin/sh

# Simple script to handle a DIY shutdown menu. When run you should see a bunch of options (shutdown, reboot etc.)
#
# Requirements:
# - rofi
# - systemd, but you can replace the commands for OpenRC or anything else
#
# Instructions:
# - Save this file as power.sh or anything
# - Give it exec priviledge, or chmod +x /path/to/power.sh
# - Run it
. ~/.cache/wal/colors.sh

chosen=$(echo -e "Logout\nShutdown\nReboot" | rofi -theme ~/.config/polybar/colorblocks/scripts/rofi/launcher.rasi -font "Roboto Mono Medium 10" -dmenu)
# Info about some states are available here:
# https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html#Description

if [[ $chosen = "Logout" ]]; then
    tmux kill-server
	i3exit logout
elif [[ $chosen = "Shutdown" ]]; then
    tmux kill-server
	systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
    tmux kill-server
	systemctl reboot
fi
