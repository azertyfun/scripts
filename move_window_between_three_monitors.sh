#!/bin/bash

# Original script by contribucious on github https://github.com/linuxmint/Cinnamon/issues/2190#issuecomment-19863084

# screen width (the effective resolution! just set yours here.)
screen_width1=1440
screen_width2=1920
screen_width3=1366

screen2_location=1440
screen3_location=3360

# ACTIVE window
window=`xdotool getactivewindow`

# get ACTIVE window size and position
x=`xwininfo -id $window | grep "Absolute upper-left X" | awk '{print $4}'`
w=`xwininfo -id $window | grep "Width" | awk '{print $2}'`

maximized=false

direction=$1

# window on left monitor
if [ "$x" -lt "$screen_width1" ]; then
    if [ "$w" -eq "$screen_width1" ]; then
        maximized=true
    fi

    if $maximized; then
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
    fi

    if [ "$direction" == "left" ]; then
        wmctrl -r :ACTIVE: -e 0,$screen3_location,-1,-1,-1
    elif [ "$direction" == "right" ]; then
        wmctrl -r :ACTIVE: -e 0,$screen2_location,-1,-1,-1
    fi

    if $maximized; then
        wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    fi

# window on middle monitor
elif [ "$x" -lt "$screen_width2" ] ; then
    if [ "$w" -eq "$screen_width2" ]; then
        maximized=true
    fi

    if $maximized; then
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
    fi

    if [ "$direction" == "left" ]; then
        wmctrl -r :ACTIVE: -e 0,0,-1,-1,-1
    elif [ "$direction" == "right" ]; then
        wmctrl -r :ACTIVE: -e 0,$screen3_location,-1,-1,-1
    fi

    if $maximized; then
        wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    fi

# window on right monitor
else
    if [ "$w" -eq "$screen_width3" ]; then
        maximized=true
    fi

    if $maximized; then
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
    fi

    if [ "$direction" == "left" ]; then
        wmctrl -r :ACTIVE: -e 0,$screen2_location,-1,-1,-1
    elif [ "$direction" == "right" ]; then
        wmctrl -r :ACTIVE: -e 0,0,-1,-1,-1
    fi

    if $maximized; then
        wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    fi
fi
