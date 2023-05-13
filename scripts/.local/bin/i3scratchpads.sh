#!/bin/sh

# Kill running scratchpads
pgrep -f "st -c drop_*" | xargs kill
# Start each scratchpad
st -c drop_calc sh -c "bc -l" &
st -c drop_monitor sh -c "setupcadmenu.sh" &
st -c drop_music sh -c "ncmpcpp --quiet 2> /dev/null" &
