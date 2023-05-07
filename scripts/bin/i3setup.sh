#!/bin/sh

i3-msg "workspace 3; append_layout ~/.config/i3/workspace-3.json"
firefox &

i3-msg "workspace 2; append_layout ~/.config/i3/workspace-2.json"
st -t "term1" "nvim" &
st -t "term2" "ranger" &
st -t "term3" "newsboat" &

i3-msg "workspace 2"

~/bin/i3start.sh
