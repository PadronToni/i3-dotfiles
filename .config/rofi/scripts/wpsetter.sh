#!/bin/bash

# ---------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------

DIR_WP="$HOME/Immagini/Sfondi"
THEME="themes/colourscheme.rasi"

ROFI=$(which rofi)
# Checks if rofi is installed
if [ -z "$ROFI" ]
then
    echo "Did not find rofi, there is no point to continue."
    exit 1
fi

NITROGEN=$(which nitrogen)
# Checks if nitrogen is installed
if [ -z "$NITROGEN" ]
then
    echo "Did not find nitrogen, there is no point to continue."
    exit 1
fi

# ---------------------------------------------------------
# FUNCTIONS
# ---------------------------------------------------------


# ---------------------------------------------------------
# EXECUTION
# ---------------------------------------------------------

RES=$( time find $DIR_WP -iname "*.jpg" -or -iname "*.png" -type f | $ROFI -dmenu -no-custom -i )

if [ -n "$RES" ]
then
    # set the selected wallpaper
    nitrogen --set-zoom-fill $RES
    # success notification
    notify-send "Rofi - Wallpaper Setter" "The wallpaper\n<span font_weight='ultrabold'>\"$RES\"</span>\nhas been applied"
fi
