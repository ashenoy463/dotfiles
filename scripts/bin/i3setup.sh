#!/bin/sh

~/bin/i3start.sh

i3-msg "workspace 3; append_layout ~/.config/i3/workspace-3.json"
firefox &

i3-msg "workspace 2; append_layout ~/.config/i3/workspace-2.json"
st -t "term1" &
st -t "term2" &
st -t "term3" & 

i3-msg "workspace 2"
