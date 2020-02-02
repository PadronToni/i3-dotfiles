
#!/bin/bash

theme="themes/options.rasi"

### Options ###
screen=""
area=""
window=""
delay="靖"
# Variable passed to rofi
options="$window\n$screen\n$area\n$delay"

res="$(echo -e "${options}" | rofi -dmenu -theme ${theme} -theme-str "configuration { fake-transparency: false; } #textbox-title { str: \"Screenshot\"; } #mainbox { margin: 0 28%;  }" -selected-row 1)"

case ${res} in
    ${screen})
        sleep 1; scrot ~/Immagini/Screenshots/screenshot_%F_%H%M%S.png
        notify-send "Screenshot" "of the whole screen"
        ;;
    ${area})
        scrot -s ~/Immagini/Screenshots/screenshot_%F_%H%M%S.png
        notify-send "Screenshot" "of selected area"
        ;;
    ${window})
        sleep 1; scrot -u ~/Immagini/Screenshots/screenshot_%F_%H%M%S.png
        notify-send "Screenshot" "of the active window"
        ;;
    ${delay})
        sleep 4; scrot ~/Immagini/Screenshots/screenshot_%F_%H%M%S.png
        ;;
esac

