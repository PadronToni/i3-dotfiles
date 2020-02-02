
#!/bin/bash

# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

    theme="themes/options.rasi"

    ### Options ###
    Poweroff=""
    Reboot=""
    Lock=""
    Suspend="鈴"
    Logout=""
    # Variable passed to rofi
    options="$Poweroff\n$Reboot\n$Lock\n$Suspend\n$Logout"

# ---------------------------------------------------------
# START
# ---------------------------------------------------------

    RES=$( echo -e "$options" | rofi -dmenu -theme ${theme} -theme-str "#textbox-title { str: \"Power Menu\"; } #mainbox { margin: 0 22%;  }" -selected-row 2 )
    
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
            echo "sas"
            ;;
    esac



