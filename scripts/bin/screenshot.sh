#!/bin/sh

uploadshot () {
    path=$(ls -Art $HOME/Pictures/Screenshots/ | tail -n 1)
    spath="$HOME/Pictures/Screenshots/"$path
    xclip -selection clipboard -t image/png -i $spath 
    notify-send -u low "Screen Captured" $spath
}

if [ $1 == "-r" ]
then
    if [ $2 == "-t" ]
    then
        sleep "$3"
        cd $HOME/Pictures/Screenshots
        scrot -s
        uploadshot
    else
        cd $HOME/Pictures/Screenshots
        scrot -s
        uploadshot
    fi   
fi

if [ $1 == "-s" ]
then
    if [ $2 == "-t" ]
    then
        sleep "$3"
        cd $HOME/Pictures/Screenshots
        scrot
        uploadshot
    else
        cd $HOME/Pictures/Screenshots
        scrot
        uploadshot
    fi
fi
