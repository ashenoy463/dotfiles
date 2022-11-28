#!/bin/sh

# Kill running scratchpads
pgrep -f urxvt\ -name\ drop_ | xargs kill
xrdb ~/.Xresources
# Start each scratchpad
urxvt -name drop_calc -hold -e bc -l &
urxvt -name drop_monitor -hold -e ~/bin/setupcadmenu.sh &
urxvt -name drop_music -hold -e sh -c "ncmpcpp -q 2> /dev/null" &
