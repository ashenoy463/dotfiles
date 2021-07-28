#!/bin/bash
# Create a neat system monitor, volume control, and notepad in tmux
tmux kill-session -t SysMonitor
tmux new-session -d -s SysMonitor 'htop'
tmux select-window -t SysMonitor:0
tmux split-window -h 'pulsemixer'
tmux split-window -v -t 1 "echo '----ZSH HISTORY----'; tail -f ~/.zsh_history"
tmux resize-pane -R -t SysMonitor:0 50
tmux -2 attach-session -t SysMonitor
