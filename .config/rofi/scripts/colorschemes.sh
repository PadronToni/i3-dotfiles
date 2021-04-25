#!/bin/bash

# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

LINK_NAME="set"
DIR_COLORS="$HOME/.Xresources.d/colors"
DIR_LINK="$DIR_COLORS/$LINK_NAME"
SCRIPTS_DIR="$HOME/.scripts"

THEME="themes/colourscheme.rasi"
CUR_THEME=$( readlink $DIR_LINK )

ROFI=$(which rofi)

# Checks if rofi is installed
if [ -z "$ROFI" ]
then
    echo "Did not find rofi, there is no point to continue."
    exit 1
fi


# ---------------------------------------------------------
# FUNCTIONS
# ---------------------------------------------------------

cur_theme_number () {
    local css=$( ls -I $LINK_NAME $DIR_COLORS)

    local counter=0
    for l in $css; do
        if [ $l == $CUR_THEME ]; then break; fi
        ((counter++))
    done
    echo $counter
}

cs_list () {
    cd $DIR_COLORS
    local css=$( ls -I $LINK_NAME)

    for i in $css; do
        local tmp_colors=$( cat $i | awk '/\*\.?color.*:|\*\.?.*ground:/' | sort -t r -k2 -n | awk '{print $2}' )
        declare -a colors

        for e in $tmp_colors; do
            colors+=($e)
        done

        local cs_preview=""
        if [[ ${colors[0]} =~ \#.* ]];
        then
            cs_preview+="<span foreground='${colors[2]}' background='${colors[0]}' size='15500'>  ──  </span>"
            cs_preview+="<span foreground='${colors[1]}' background='${colors[10]}' size='15500'>▀</span>"
            cs_preview+="<span foreground='${colors[3]}' background='${colors[11]}' size='15500'>▀</span>"
            cs_preview+="<span foreground='${colors[4]}' background='${colors[12]}' size='15500'>▀</span>"
            cs_preview+="<span foreground='${colors[5]}' background='${colors[13]}' size='15500'>▀</span>"
            cs_preview+="<span foreground='${colors[6]}' background='${colors[14]}' size='15500'>▀</span>"
            cs_preview+="<span foreground='${colors[7]}' background='${colors[15]}' size='15500'>▀</span>"
            cs_preview+="<span foreground='${colors[8]}' background='${colors[16]}' size='15500'>▀</span>"
            cs_preview+="<span foreground='${colors[9]}' background='${colors[17]}' size='15500'>▀</span>"
            # cs_preview+="<span foreground='${colors[$counter]}' background='${colors[(($counter+8))]}' size='15500'>▀</span>"
        else
            cs_preview+="not supported preview"
        fi

        if [ -z "$rows" ]
        then
            rows+="$( printf "%-30s" "$i" )$cs_preview"
        else
            rows+="\n$( printf "%-30s" "$i" )$cs_preview"
        fi

        unset colors
    done
    echo -e "$rows"
}


refresh_all () {
    xrdb ~/.Xresources && $SCRIPTS_DIR/./CSDealer/csdealer && xrdb ~/.Xresources
    $SCRIPTS_DIR/./transparentBg.sh
    $SCRIPTS_DIR/./dunstreload

    # self explanatory
    i3-msg restart

    # update all Urxvt instances (sends a SIGUP signal to urxvt in order to activate the perl extension "config-reload",  see: https://github.com/regnarg/urxvt-config-reload)
    kill -s 1 $( pidof urxvt )
}

# ---------------------------------------------------------
# EXECUTION
# ---------------------------------------------------------

MESG="<span weight='bold' size='xx-large'>Colour Scheme Switcher</span>

choose from the list of colour schemes available in your system

<span weight='bold' size='large'>Current: $CUR_THEME</span>"

# cs_list
RES=$( cs_list | $ROFI -dmenu -markup -markup-rows -no-custom -i -a $( cur_theme_number ) -theme $THEME -mesg "$MESG" -theme-str "#textbox-csHeader { str: \"$CUR_THEME preview\";}" | awk '{print $1}' )

if [ -n "$RES" ]
then
    # set the selected colorscheme
    cd $DIR_COLORS
    ln -s -f "$RES" "$LINK_NAME"

    # refresh all the system component
    refresh_all

    # success notification
    notify-send "Rofi - Colour Scheme Switcher" "The colour scheme <span font_weight='ultrabold'>\"$RES\"</span> \nhas been applied throughout the system"
fi
