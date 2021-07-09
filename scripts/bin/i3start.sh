#!/bin/sh
. ~/.profile

pkill picom
pkill dunst

python -m pywal -i $RICE_WALLPAPER

picom -b --config $CONF_PICOM
$HOME/bin/dunstthemeupdate.sh
pywal-discord

rm $HOME/.config/dunst/dunstrc
mv $HOME/.config/dunst/dunstrc_xr_colors $HOME/.config/dunst/dunstrc

dunst &
