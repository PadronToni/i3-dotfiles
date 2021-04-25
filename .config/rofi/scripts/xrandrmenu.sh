#!/bin/bash

# VARIABLES
monitor0="eDP1"
monitor1="HDMI1"
theme="themes/options.rasi"
item_size=6

# options to be displyed
option0="activate all monitors"
option1=""
option2=""
option3="monitor $monitor0 primary"
option4="monitor $monitor1 primary"
option5="monitor $monitor1 same as $monitor0"
option6=" + "
option7="monitor $monitor1 left of $monitor0"
option8="monitor $monitor1 above $monitor0"
option9="monitor $monitor1 below $monitor0"
option10="rotate monitor $monitor1 right"
option11="rotate monitor $monitor1 left"
option12="rotate monitor $monitor1 normal"

# Variable passed to rofi
options="$option2\n$option6\n$option1"

# ---------------------------------------------------------
# FUNCTIONS
# ---------------------------------------------------------

gen_size () {
    local counter=$( echo -e "$options" | wc -l )
    echo $(( $counter*$item_size ))
}

refresh() {
    killall "picom"
    nitrogen --restore
    i3-msg restart
}

# ---------------------------------------------------------
# START
# ---------------------------------------------------------

res="$(echo -e "$options" | rofi -dmenu -theme ${theme} -theme-str "#textbox-title { str: \"Monitors\"; } #mainbox { width: $( gen_size )em; }" -selected-row 1)"

case $res in
    $option0)
        xrandr --auto
        refresh
        ;;
    $option1)
        xrandr --output $monitor0 --off --output $monitor1 --auto
        refresh
        ;;
    $option2)
        xrandr --output $monitor1 --off --output $monitor0 --auto
        refresh
        ;;
	$option3)
		xrandr --output $monitor0 --primary
        ;;
	$option4)
		xrandr --output $monitor1 --primary
        ;;
    $option5)
        xrandr --output $monitor1 --same-as $monitor0
        ;;
    $option6)
        xrandr  --output $monitor0 --noprimary --auto --output $monitor1 --primary --auto --right-of $monitor0
        refresh
        ;;
    $option7)
        xrandr  --output $monitor0 --noprimary --auto --output $monitor1 --primary --auto --left-of $monitor0
        ;;
    $option8)
        xrandr --output $monitor1 --above $monitor0
        ;;
    $option9)
        xrandr --output $monitor1 --below $monitor0
        ;;
    $option10)
        xrandr --output $monitor1 --rotate left
        ;;
    $option11)
        xrandr --output $monitor1 --rotate right
        ;;
    $option12)
        xrandr --output $monitor1 --rotate normal
        ;;
esac
