
#!/bin/bash
XDOTOOL=$( pidof xdotool )
if [ -n "$XDOTOOL" ] 
then
        kill -s 9 $XDOTOOL
        notify-send "Xdotool" "Process has been killed" -t 10000
        exit 1
fi
# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

theme="themes/menulist.rasi"

### Options ###
op1="MOUSE - Long-press LEFT"
op2="MOUSE - Long-press RIGHT"
op3="MOUSE - Perpetual click LEFT"
op4="MOUSE - Perpetual click RIGHT"
# Variable passed to rofi
options="$op1\n$op2\n$op3\n$op4"


# ---------------------------------------------------------
# START
# ---------------------------------------------------------

RES=$( echo -e "$options" | rofi -l 4 -dmenu -theme ${theme} -theme-str "#textbox-title { str: \"Xdotool actions\"; }" )

case "${RES}" in
    ${op1})
        notify-send "Xdotool" "Mouse long-press <span font_weight='ultrabold'>LEFT</span> \n\nPress again the bindkey to kill the process" -t 10000
        xdotool mousedown 1
        ;;
    ${op2})
        notify-send "Xdotool" "Mouse long-press <span font_weight='ultrabold'>RIGHT</span> \n\nPress again the bindkey to kill the process" -t 10000
        xdotool mousedown 3
        ;;
    ${op3})
        notify-send "Xdotool" "Mouse perpetual click <span font_weight='ultrabold'>LEFT</span> \n\nPress again the bindkey to kill the process" -t 10000
        xdotool click --repeat 1000000 --delay 1000 1
        ;;
    ${op4})
        notify-send "Xdotool" "Mouse perpetual <span font_weight='ultrabold'>RIGHT</span> \n\nPress again the bindkey to kill the process" -t 10000
        xdotool click --repeat 1000000 --delay 1000 3
        ;;
#     *)
#         break
#         ;;
esac
