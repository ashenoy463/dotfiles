#!/bin/sh
# Script set to be automatically run by a systemd service

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

stylus=$(echo "$(xsetwacom list devices)" | awk '/stylus/{print $9}')
xsetwacom --set "${stylus}" Rotate half

# /etc/udev/rules.d/99-wacom.rules
# 
#ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="056a", TAG+="systemd", ENV{SYSTEMD_USER_WANTS}+="wacom.service"

# ~/.config/systemd/user/wacom.service
# 
#[Unit]
#Description=Configure my Wacom tablet
#After=graphical-session.target
#PartOf=graphical-session.target
#
#[Service]
#Type=oneshot
#ExecStart=/home/ayush/bin/wacomconfigure.sh
#
#[Install]
#WantedBy=graphical-session.target
