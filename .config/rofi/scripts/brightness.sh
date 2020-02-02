
#!/bin/bash

### Options ###
inc="+5"
dec="-5"
# Variable passed to rofi
options="$inc\n$dec"

# Start script
if [ -z $@ ]
then
    echo -e "$options"
else
    case $@ in
        $inc)
            xbacklight -inc 5
            ;;
        $dec)
            xbacklight -dec 5
            ;;
        *)
            echo "$@"
            ;;
    esac
    echo -e "$options"
fi
