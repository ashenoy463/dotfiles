#!/bin/sh

xrdb ~/.Xresources # for ST

tmux new-session -d -s Term1 "nvim; clear; zsh"
tmux new-session -d -s Term2 "ranger; clear; zsh"
tmux new-session -d -s Term3 "newsboat; clear; zsh"

i3-msg "workspace 2; append_layout ~/.config/i3/workspace-2.json"
st -t term1 sh -c "tmux a -t Term1" &
st -t term2 sh -c "tmux a -t Term2" &
st -t term3 sh -c "tmux a -t Term3" &

i3-msg "workspace 3; append_layout ~/.config/i3/workspace-3.json"
firefox &

i3-msg "workspace 2"
