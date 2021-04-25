
#!/bin/bash
# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

theme="themes/menulistalt.rasi"
menu_name="Keymaps"

### Options ###
op1="English"
op2="Italian"
# Variable passed to rofi
options="$op1\n$op2"


# ---------------------------------------------------------
# START
# ---------------------------------------------------------

RES=$( echo -e "$options" | rofi -dmenu -i -l 2 -theme ${theme} -theme-str " #mainbox { margin: 0 45%; } #textbox-title { str: \"$menu_name\"; }  #element-text { horizontal-align:   0.5; }" )

case "${RES}" in
    ${op1})
        setxkbmap us
        ;;
    ${op2})
        setxkbmap it
        ;;
#     *)
#         break
#         ;;
esac
