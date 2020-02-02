#!/bin/bash

# Variables
OPEN="xdg-open "
TERM="urxvt -cd "  #insert also any option that allows to open your terminal in that directory
FM="pcmanfm"    #File manager app
DIR=~/.config/rofi/dir

# Start script
if [ -z $@ ]
then
    echo "--> Advanced (all dirs and files)"
    locate home/
else
    if [ "$@" = "--> Advanced (all dirs and files)" ]
    then
        echo "--> Normal (only home dirs and files)"
        locate /
    else
        if [[ -d "$@" || -f "$@" ]]
        then
            if [ -d "$@" ]
            then
                echo "Terminal"
                echo "File Manager"
                echo "<--"
                echo "$@" > ${DIR}
            fi
            if [ -f "$@" ]
            then
                ${OPEN} "$@" > /dev/null 2>&1 &
                exit;
            fi
        else
            if [ "$@" = "File Manager" ]
            then
                ${FM} "$(cat ${DIR})" > /dev/null 2>&1 &
                exit;
            fi
    
            if [ "$@" = "Terminal" ]
            then
                ${TERM} "$( cat ${DIR} )" > /dev/null 2>&1 & 
                exit;
            fi
            echo "--> Advanced (all dirs and files)"
            locate home
        fi
    fi
fi





