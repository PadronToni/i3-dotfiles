
#!/bin/bash

bag=$(xrdb -query | grep 'background:'| awk '{print $2; exit}')

echo "

[colors]
bg = \${xrdb:background}
bgTra = #85${bag:1} 
bgSemiTra = #bb${bag:1} 
fg = \${xrdb:foreground}

moduleBg = \${self.bgSemiTra}
moduleFg = \${xrdb:foreground}

trayBg   = \${xrdb:background}

modules_prefix_bg = \${xrdb:color7}
modules_prefix_fg = \${xrdb:color0}

urgent_window  = \${xrdb:color9}
focused_window = \${xrdb:color3}

" > ~/.config/polybar/colors.ini

