
#!/bin/bash

# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

theme="themes/options.rasi"
item_size=5

### Options ###
Poweroff=""
Reboot=""
Lock=""
Suspend="鈴"
Logout=""
# Variable passed to rofi
options="$Poweroff\n$Reboot\n$Lock\n$Suspend\n$Logout"

# ---------------------------------------------------------
# FUNCTIONS
# ---------------------------------------------------------

gen_size () {
    local counter=$( echo -e "$options" | wc -l )
    echo $(( $counter*$item_size ))
}

# ---------------------------------------------------------
# START
# ---------------------------------------------------------

RES=$( echo -e "$options" | rofi -dmenu -theme ${theme} -theme-str "#textbox-title { str: \"Power Menu\"; } #mainbox { width: $( gen_size )em; }" -selected-row 2 )

case "${RES}" in
    ${Suspend})
        sleep 1; systemctl suspend; i3lock-next
        ;;
    ${Lock})
        sleep 1; i3lock-next
        ;;
    ${Logout})
        exec killall -u ${USER}
        ;;
    ${Poweroff})
        exec systemctl poweroff
        ;;
    ${Reboot})
        exec systemctl reboot
        ;;
    *)
        break
        ;;
esac
