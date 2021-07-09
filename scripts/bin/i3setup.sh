#!/bin/sh

~/bin/i3start.sh

i3-msg "workspace 3; append_layout ~/.config/i3/workspace-3.json"
firefox &

i3-msg "workspace 2; append_layout ~/.config/i3/workspace-2.json"
urxvt -name "term1" -e "nvim" &
urxvt -name "term2" -e "ranger" &
urxvt -name "term3" -e "zsh" &

i3-msg "workspace 2"
