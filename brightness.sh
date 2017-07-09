#!/bin/bash
CURRENT_BRIGHTNESS=$(xrandr --verbose| awk '/^eDP-1-1/,/^DP1/{if ($1 ~ /Brightness/) {print $NF; exit} }')
if [ "$1" =  "dec" ]
then
    xrandr --output eDP-1-1 --brightness  `echo $CURRENT_BRIGHTNESS - 0.1 |bc`
elif [ "$1" = "inc" ]
then
    xrandr --output eDP-1-1 --brightness `echo $CURRENT_BRIGHTNESS + 0.1 |bc`
else
    xrandr --output eDP-1-1 --brightness 1
    echo brightess reset
fi


if awk 'BEGIN{exit ARGV[1]<ARGV[2]}' "$CURRENT_BRIGHTNESS" "1"
then
    xrandr --output eDP-1-1 --brightness 1
fi
