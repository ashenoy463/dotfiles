#!/bin/sh
path="$HOME/Pictures/Screenshots/$(date +%s).png"
clipshot () {
    maim -s "$path" && xclip -selection clipboard -t image/png "$path" && notify-send -u low "Screen Captured"
}
shot () {
    maim "$path" && xclip -selection clipboard -t image/png "$path" && notify-send -u low "Screen Captured"
}

if [ $1 == "-r" ]
then
    if [ $2 == "-t" ]
    then
        sleep "$3"
        clipshot
    else
        clipshot
    fi   
fi

if [ $1 == "-s" ]
then
    if [ $2 == "-t" ]
    then
        sleep "$3"
        shot
    else
        shot
    fi
fi
