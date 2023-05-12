#!/bin/sh

. ~/.cache/wal/colors.sh

notify-send.py -r 42069 'Now Playing' "$(ncmpcpp --current-song="<span foreground='$color7'>{%t}</span><br><span foreground='$color3'>{%a}</span><br><span foreground='$color6'>%b</span><br><span foreground='$color5'>%l</span>")"
